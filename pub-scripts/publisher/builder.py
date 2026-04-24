import os
import json
import shutil
import subprocess
import logging
from pathlib import Path
from .downloader import get_latest_cqf_tooling_url
from .config import CQF_TOOLING_JAR, load_configuration, initialize_webroot
from .utils import log_command

# Global variable for config data
config_data = None

def initialize_config_data(ig_repo_path):
    """Initialize the global config_data variable."""
    global config_data
    config_data = load_configuration(str(Path(ig_repo_path).resolve()))
    return config_data


def run_command(cmd_list, cwd=None, dry_run=False):
    """Local helper to run commands and safely stream and log their output."""
    logger = logging.getLogger()
    cmd_str = " ".join(cmd_list) if isinstance(cmd_list, list) else cmd_list
    log_command(logger, cmd_str)

    if dry_run:
        logger.info("[DRY RUN] Skipping command execution.")
        return

    use_shell = isinstance(cmd_list, str)
    try:
        process = subprocess.Popen(
            cmd_list,
            shell=use_shell,
            cwd=cwd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            bufsize=1
        )
        
        for line in iter(process.stdout.readline, ''):
            if line.strip():
                # Streaming out as INFO so it persists in publish.log
                logger.info(line.strip('\n'))
                
        process.stdout.close()
        return_code = process.wait()
        
        if return_code != 0:
            raise subprocess.CalledProcessError(return_code, cmd_list)
            
    except subprocess.CalledProcessError as e:
        logger.error(f"Command failed with exit code {e.returncode}: {cmd_str}")
        raise RuntimeError(f"Command failed with exit code {e.returncode}: {cmd_str}")


def run_ig_build(ig_repo_path, dry_run: bool = False):
    """Run the IG build process on the cloned IG repository."""
    logger = logging.getLogger()
    
    # sushi relies on knowing the current directory.
    logger.info("Pre building with sushi")
    run_command("sushi .", cwd=str(ig_repo_path), dry_run=dry_run)
    
    cwd = Path(ig_repo_path).resolve()
    logger.debug(f"Current Working Directory: {cwd}")

    # Copy ImplementationGuide json
    fsh_generated_resources = cwd.joinpath('fsh-generated/resources')
    
    if not dry_run and fsh_generated_resources.exists():
        ig_json_files = list(fsh_generated_resources.glob('ImplementationGuide-*.json'))  
        if ig_json_files:
            latest_ig_json = max(ig_json_files, key=os.path.getctime)
            target = cwd.joinpath('input/data/ig.json')
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy(latest_ig_json, target)
            logger.info(f"Copied {latest_ig_json.name} to {target}")
        else:
            logger.warning("No ImplementationGuide-*.json files found in fsh-generated/resources.")
    elif not dry_run:
        logger.warning(f"{fsh_generated_resources} does not exist. Skipping copy.")

    # Build with CQF Tooling if CQL files are present
    cqf_jar_path = cwd.parent.joinpath(CQF_TOOLING_JAR)
    if cqf_jar_path.is_file():
        logger.info("Running CQF Tooling")
        if not dry_run:
            shutil.copy(str(cqf_jar_path), str(cwd.joinpath(CQF_TOOLING_JAR)))
        
        cqf_build_cmd = [
            "java", "-Dfile.encoding=UTF-8", "-jar", CQF_TOOLING_JAR,
            "-RefreshIG", f"-ini=./ig.ini", "-t", "-d", "-ss=false", "-timestamp=true"
        ]
        run_command(cqf_build_cmd, cwd=str(cwd), dry_run=dry_run)
    else:
        logger.info("CQF Tooling jar DOES NOT Exist, skipping CQF tooling")

    # Run the standard IG Publisher build
    logger.info("Running individual IG build")
    publisher_jar_path = cwd.parent.joinpath("publisher.jar")
    ig_build_cmd = [
        "java", "-Dfile.encoding=UTF-8", "-jar", str(publisher_jar_path.resolve()), 
        "-no-sushi", "-ig", "."
    ]
    run_command(ig_build_cmd, cwd=str(cwd), dry_run=dry_run)


def run_full_build(publish_path, ig_repo_path, dry_run: bool = False):
    """Run the full IG build process using the publisher and CQF tooling."""
    logger = logging.getLogger()
    logger.info("Running full versioned IG build")
    
    base_path = Path(publish_path).resolve()
    
    # Ensure temp dir exists for -temp
    temp_dir = base_path.joinpath('temp')
    if not dry_run:
        temp_dir.mkdir(exist_ok=True)

    full_build_cmd = [
        "java", "-Dfile.encoding=UTF-8", "-jar", "publisher.jar", "-go-publish",
        "-source", str(Path(ig_repo_path).resolve()),
        "-web", str(base_path.joinpath('webroot')),
        "-registry", str(base_path.joinpath('ig-registry/fhir-ig-list.json')),
        "-history", str(base_path.joinpath('ig-history')),
        "-templates", str(base_path.joinpath('templates')),
        "-temp", str(temp_dir)
    ]
    
    run_command(full_build_cmd, cwd=str(base_path), dry_run=dry_run)

    # The below code is not needed if the publication-request.json is correctly set to a `mode` of `milestone`
    # After full build, copy the generated version into the webroot/ig folder
    # generated_version = Path(ig_repo_path).resolve().joinpath('input/data/ig.json')
    # if not dry_run and generated_version.is_file():
    #     try:
    #         import json
    #         with open(generated_version, 'r', encoding='utf-8', errors='ignore') as f:
    #             ig_data = json.load(f)
    #             version = ig_data.get('version', 'unknown')
                
    #             source_dir = base_path.joinpath(f'webroot/ig/{version}')
    #             target_dir = base_path.joinpath('webroot/ig/')
                
    #             logger.info(f"Copying generated version {version} into {target_dir} for post processing")
    #             if source_dir.exists():
    #                 shutil.copytree(str(source_dir), str(target_dir), dirs_exist_ok=True)
    #             else:
    #                 logger.warning(f"Source version directory {source_dir} not found.")
    #     except Exception as e:
    #         logger.error(f"Failed to copy generated version: {e}")
    # else:
    #     logger.info("Generated version file not found or dry-run active, skipping copy to webroot/ig")


def initialize_output_folder(ig_repo_path, ig_publisher_url, dry_run: bool = False):
    """Initialize the output folder by downloading the latest publisher.jar."""
    logger = logging.getLogger()
    logger.info("Retrieving the latest build jar files (publisher.jar)")
    
    run_command(["curl", "-L", ig_publisher_url, "-o", "./publisher.jar"], dry_run=dry_run)

    cql_dir = Path(ig_repo_path).resolve().joinpath('input/cql')
    files = list(cql_dir.glob('*.cql')) if cql_dir.exists() else []
    
    if len(files) > 0:
        tooling_url = get_latest_cqf_tooling_url()
        logger.info("CQL Files found. Retrieving the latest tooling-cli.jar")
        run_command(["curl", "-L", tooling_url, "-o", "./tooling-cli.jar"], dry_run=dry_run)
    else:
        logger.info("No CQL Files found. Will not download CQF Tooling")

    #if not dry_run:
    if config_data is None:
        initialize_config_data(ig_repo_path)
    initialize_webroot(config_data=config_data, ig_repo_path=ig_repo_path)
    #else:
    #    logger.info("[DRY RUN] Skipping load_configuration and initialize_webroot")


def initialize_publication_version(ig_repo_path, dry_run: bool = False):
    """Initialize the publication version by loading the configuration and writing the publication list."""
    logger = logging.getLogger()
    logger.info("Initializing publication version")
    
#    update_package_list(ig_repo_path=ig_repo_path)

# def update_package_list(ig_repo_path):
#     """Update the package list in the webroot based on the provided configuration data."""
#     # TODO fix package-list initiation. Canonical is unknown
#     #TODO testing test with feed in repo
#     logger = logging.getLogger()
#     package_list_path = ig_repo_path.joinpath("package-list.json")

#     #open the publication-request.json file in the ig_repo_path
#     publication_request_path = ig_repo_path.joinpath("publication-request.json")
#     if not publication_request_path.is_file():
#         logger.error(f"Publication request file not found at {publication_request_path}")
#         return

#     publication_request = None
#     try:
#         with open(publication_request_path, 'r', encoding='utf-8') as f_pr:
#             publication_request = json.load(f_pr)
            
#     except Exception as e:
#         logger.error(f"Failed to read publication request: {e}") 
#         return

#     # If the publication request file exists and is read successfully, check if the package list file exists. If it does not exist, initialize it with the publication request information. If it does exist, read the existing package list and append the new package information from the publication request to the list, then write it back to the package list file. This ensures that the package list is always up to date with the latest publication request information, and that there is a baseline package list file for the publisher to reference even if the publication request is not properly configured. The package information added to the list includes the package-id, title, canonical, introduction, and category from the publication request, using "unknown" for any missing fields.
#     if publication_request is not None:
#         if not package_list_path.is_file():
#             logger.error(f"Package list file not found at {package_list_path}")
#             # if the file does not exist, initialize it with the publication request information, using the package-id, title, canonical, introduction, and category if present in the publication request, otherwise use "unknown" for any missing fields. This ensures that there is at least a baseline package list file for the publisher to reference, even if the publication request is not properly configured.

#             try:
#                 package_list = [{
#                     "package-id": publication_request.get("package-id", "unknown"),
#                     "title": publication_request.get("title", "unknown"),
#                     "canonical": publication_request.get("canonical", "unknown"),
#                     "introduction": publication_request.get("introduction", "unknown"),
#                     "category": publication_request.get("category", "unknown")
#                 }]

#                 logger.info(f"Initialized package list at {package_list_path} with version: {publication_request.get('version', 'unknown')}, status: {publication_request.get('mode', 'unknown')}, date: {publication_request.get('date', 'unknown')}")
#             except Exception as e:
#                 logger.error(f"Failed to initialize package list: {e}")
#                 return
#         else:
#            # Open and read the package list file
#             try:
#                 with open(package_list_path, 'r', encoding='utf-8') as f:
#                     package_list = json.load(f)
#             except Exception as e:
#                 logger.error(f"Failed to read package list: {e}")
#                 return


#         # Finish setting up the package-list data and then write to the package-list file in the ig_repo_path
#         # Verify that the package list file has the ci build configured (If not, read from the package-request file and update)
#         #Iterate through all of the package list "list" elements to see if there is a version = "current
#         ci_package_exists = False
#         for item in package_list.get("list", []):
#             if item.get("version") == "current":
#                 logger.info("Package list already has a current version configured, skipping update.")
#                 ci_package_exists = True
#                 break

#         if(not ci_package_exists):
#             package_list.setdefault("list", []).append({
#                 "version": "current",
#                 "desc" : "Continuous Integration Build (latest in version control)",
#                 "path": publication_request.get("ci-build", "unknown"),
#                 "status": "ci-build",
#                 "fhirversion": publication_request.get("fhirversion", "4.0.1")
#             })
        
#         #Check to see if the current publication request version is in the package list. If so, remove it
#         existing_versions = [item.get("version") for item in package_list.get("list", [])]
#         if publication_request.get("version") in existing_versions:
#             package_list["list"] = [item for item in package_list.get("list", []) if item.get("version") != publication_request.get("version")]
#             logger.info(f"Removed existing version {publication_request.get('version')} from package list to prepare for update.")

#         #If the publication request status is not "milestone", log a warning and do not add it to the package list, as the publisher will only reference versions with a status of "milestone" or "ci-build". This ensures that any versions that are not intended for publication do not accidentally get added to the package list and potentially published by the publisher.
#         if publication_request.get("mode") != "milestone":
#             logger.warning(f"Publication request version {publication_request.get('version', 'unknown')} has status {publication_request.get('mode', 'unknown')}, which is not 'milestone'. Will continue processing.")

#         if publication_request.get("status") != "release":
#             logger.warning(f"Publication request version {publication_request.get('version', 'unknown')} has status {publication_request.get('status', 'unknown')}, which is not 'release'. Will continue processing.")

#         # Add current publication request version using information from the publication request file, using "unknown" for any missing fields
#         package_list.setdefault("list", []).append({
#             "version": publication_request.get("version", "unknown"),
#             "desc" : publication_request.get("desc", "unknown"),
#             "path": publication_request.get("path", "unknown"),
#             "status": publication_request.get("status", "milestone"),
#             "fhirversion": publication_request.get("fhirversion", "4.0.1"),
#             "current": True
#         })

#         try:            
#             with open(package_list_path, 'w', encoding='utf-8') as f:
#                 json.dump(package_list, f, indent=2)
#                 logger.info(f"Updated package list at {package_list_path} with version: {publication_request.get('version', 'unknown')}, status: {publication_request.get('mode', 'unknown')}, date: {publication_request.get('date', 'unknown')}")
#         except Exception as e:
#             logger.error(f"Failed to write package list: {e}")
#             return
