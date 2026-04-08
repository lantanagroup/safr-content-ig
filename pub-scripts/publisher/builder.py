import os
import shutil
import subprocess
import logging
from pathlib import Path
from .downloader import get_latest_cqf_tooling_url
from .config import CQF_TOOLING_JAR, load_configuration, initialize_webroot
from .utils import log_command


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

    # After full build, copy the generated version into the webroot/ig folder
    generated_version = Path(ig_repo_path).resolve().joinpath('input/data/ig.json')
    if not dry_run and generated_version.is_file():
        try:
            import json
            with open(generated_version, 'r', encoding='utf-8', errors='ignore') as f:
                ig_data = json.load(f)
                version = ig_data.get('version', 'unknown')
                
                source_dir = base_path.joinpath(f'webroot/ig/{version}')
                target_dir = base_path.joinpath('webroot/ig/')
                
                logger.info(f"Copying generated version {version} into {target_dir} for post processing")
                if source_dir.exists():
                    shutil.copytree(str(source_dir), str(target_dir), dirs_exist_ok=True)
                else:
                    logger.warning(f"Source version directory {source_dir} not found.")
        except Exception as e:
            logger.error(f"Failed to copy generated version: {e}")
    else:
        logger.info("Generated version file not found or dry-run active, skipping copy to webroot/ig")


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

    if not dry_run:
        config_data = load_configuration(str(Path(ig_repo_path).resolve()))
        initialize_webroot(config_data=config_data)
    else:
        logger.info("[DRY RUN] Skipping load_configuration and initialize_webroot")