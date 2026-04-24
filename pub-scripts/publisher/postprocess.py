import glob
import os
import logging
import requests
from pathlib import Path
from .config import reduce_file_patterns, accessibility_update_file_patterns, web_config, ig_suite_package_list
from .fix_accessibilities import fix_accessibilities_in_folder
from .builder import config_data
import json
from lxml import etree


def format_file_size(size_in_bytes: int) -> str:
    """Format a byte count into a human-readable string."""
    if size_in_bytes < 1024:
        return f"{size_in_bytes} B"
    elif size_in_bytes < 1024**2:
        return f"{size_in_bytes / 1024:.2f} KB"
    elif size_in_bytes < 1024**3:
        return f"{size_in_bytes / (1024**2):.2f} MB"
    elif size_in_bytes < 1024**4:
        return f"{size_in_bytes / (1024**3):.2f} GB"
    else:
        return f"{size_in_bytes / (1024**4):.2f} TB"

def run_accessibility_fixer_on_webroot(publish_path, dry_run: bool = False):
    """Run accessibility fixer on each subfolder in webroot/ig."""
    logger = logging.getLogger()
    webroot_ig = Path('./webroot/' + publish_path).resolve()
    if not webroot_ig.exists():
        logger.error(f"webroot ig folder not found at expected location: {webroot_ig.resolve()}")
        return

    logger.info(f"Running accessibility fixer on: {webroot_ig}")
    if dry_run:
        logger.info("[DRY RUN] Skipping accessibility fixer.")
        return

    try:
        fix_accessibilities_in_folder(str(webroot_ig))
    except Exception as e:
        logger.error(f"Failed to run accessibility fixer on {webroot_ig}: {e}")

    for entry in sorted(webroot_ig.iterdir()):
        if entry.is_dir():
            target_folder = str(entry.resolve())
            logger.info(f"Running accessibility fixer on: {target_folder}")
            try:
                fix_accessibilities_in_folder(target_folder)
            except Exception as e:
                logger.error(f"Failed to run accessibility fixer on {target_folder}: {e}")


def reduce_files(dry_run: bool = False):
    """Remove unneeded files from the generated output to reduce size."""
    logger = logging.getLogger()
    file_size_bytes = 0
    removed_count = 0

    for pattern in reduce_file_patterns:
        for filepath in glob.glob('./webroot/ig/' + pattern, recursive=True):
            try:
                size = os.path.getsize(filepath)
                if not dry_run:
                    os.remove(filepath)
                logger.debug(f"Removed file: {filepath} ({format_file_size(size)})")
                file_size_bytes += size
                removed_count += 1
            except FileNotFoundError:
                pass
            except Exception as e:
                logger.error(f"Failed to remove {filepath}: {e}")

    if dry_run:
        logger.info(f"[DRY RUN] Would remove {removed_count} files totaling {format_file_size(file_size_bytes)}.")
    else:
        logger.info(f"Reduced output by {format_file_size(file_size_bytes)} across {removed_count} files.")


def replace_strings_in_file(filepath, old_string, new_string):
    """Replace occurrences of old_string with new_string in the specified file."""
    logger = logging.getLogger()
    modified = False
    try:
        with open(filepath, 'r', encoding="utf8") as file:
            file_content = file.read()

        for i in range(len(old_string)):
            if old_string[i] in file_content:
                file_content = file_content.replace(old_string[i], new_string[i])
                modified = True

        if modified:
            with open(filepath, 'w', encoding="utf8") as file:
                file.write(file_content)

    except FileNotFoundError:
        logger.error(f"Error: File '{filepath}' not found.")
    except Exception as e:
        logger.error(f"An error occurred: {e} in file {filepath}")


def write_web_configs(ig_repo_path, publish_path, dry_run: bool = False):
    """Generate web.config files for the IG and root version."""
    logger = logging.getLogger()
    base_web_config = Path(f'./webroot/{publish_path}/web.config').resolve()
    logger.debug(f"Targeting web config: {base_web_config}")

    pub_req_path = Path(ig_repo_path) / 'publication-request.json'
    
    try:
        with open(pub_req_path, 'r') as file:
            config_data = json.load(file)
    except Exception as e:
        logger.error(f"Failed to read {pub_req_path}: {e}")
        return

    version_web_config = Path(f'./webroot/{publish_path}/{config_data["version"]}/web.config').resolve()
    logger.debug(f"Targeting version web config: {version_web_config}")

    if dry_run:
        logger.info("[DRY RUN] Skipping write of web.config files.")
        return

    try:
        if base_web_config.is_file():
            base_web_config.unlink()
        
        # Ensure parent exists
        base_web_config.parent.mkdir(parents=True, exist_ok=True)
        with open(base_web_config, "w+", encoding='utf-8') as web_config_file:
            web_config_file.write(web_config)
    except Exception as e:
        logger.error(f"Failed to write root web.config: {e}")

    try:
        if version_web_config.is_file():
            version_web_config.unlink()
            
        version_web_config.parent.mkdir(parents=True, exist_ok=True)
        with open(version_web_config, "w+", encoding='utf-8') as web_config_file:
            web_config_file.write(web_config)
    except Exception as e:
        logger.error(f"Failed to write version web.config: {e}")


# def update_ig_suite_feeds(webroot_path, ig_repo_path):
#     # Update the publication-feed.json and package-feed.json files in the IG Suite based on the current publication's package lists
#     logger = logging.getLogger()

#     ig_list = []

#     for package_id, package_list in ig_suite_package_list.items():
#         if package_id == config_data.get("package-id", "Unknown"):
#             # If the current IG is the same as the current suite IG, then use the local package-list.json file for feed entries instead of the package_list.json in the repo, which may be outdated due to changes in the publication request that have not been reflected in the repo's package-list.json
#             # TODO, there may not be a need to populate this information as the publisher may have already done so. Need to verify
#             feed_path = webroot_path.joinpath('/package-list.json')
#             # load the package-list list entries into a variable
#             try:                
#                 with open(Path(ig_repo_path) / 'package-list.json', 'r', encoding='utf-8') as f:
#                     local_package_list = json.load(f)
#                     ig_list.append({
#                         "package-id": config_data.get("package-id", "unknown"),
#                         "list": local_package_list[0].get("list", [])
#                     })
#             except Exception as e:
#                 logger.error(f"Failed to read local package-list.json for feed update: {e}")
#                 local_entries = []

#         else:
#             # For other IGs in the suite, attempt to read the package-list.json file from the repo to get feed entries. This allows the suite feeds to be updated with the latest information from the repo, even if the publication request for those IGs has not changed.
#             # Get the package-list.json from the github repo url
#             response = requests.get(package_list)
#             if response.status_code == 200:
#                 try:
#                     package_list = response.json()
#                     ig_list.append({
#                         "package-id": package_id,
#                         "list": package_list[0].get("list", [])
#                     })
#                 except Exception as e:
#                     logger.error(f"Failed to parse package-list.json for {package_id} from repo for feed update: {e}")
#                     local_entries = []
#             else:
#                 logger.error(f"Failed to retrieve package-list.json for {package_id} from repo for feed update: HTTP {response.status_code}")

#     if ig_list:
#         publication_feed_path = webroot_path.joinpath('/publication-feed.xml')
#         package_feed_path = webroot_path.joinpath('/package-feed.xml')

#         try:
#             with open(publication_feed_path, 'r+w', encoding='utf-8') as f:
#                 publication_feed_tree = etree.parse(f)
#                 root = publication_feed_tree.getroot()
#                 # Loop through all channel/item elements to load the versions from the publication feed into a list of dicts with package-id and version keys
#                 publication_entries = []
#                 for item in root.findall("/channel/item"):
#                     package_id = item.get("package-id")
#                     version = item.get("version")
#                     if package_id and version:
#                         publication_entries.append({"package-id": package_id, "version": version})


#                 for ig in ig_list:
#                     package_id = ig.get("package-id", "unknown")
#                     for entry in ig.get("list", []):
#                         version = entry.get("version", "unknown")
#                         new_entry = etree.SubElement(root, "entry")
#                         new_entry.set("package-id", package_id)
#                         new_entry.set("version", version)
#             logger.info(f"Updated publication feed at {publication_feed_path}")
#         except Exception as e:
#             logger.error(f"Failed to write publication feed: {e}")

#         try:
#             with open(package_feed_path, 'w', encoding='utf-8') as f:
#                 json.dump({"igs": ig_list}, f, indent=2)
#             logger.info(f"Updated package feed at {package_feed_path}")
#         except Exception as e:
#             logger.error(f"Failed to write package feed: {e}")