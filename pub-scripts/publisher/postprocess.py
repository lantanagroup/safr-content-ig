import glob
import os
import logging
from pathlib import Path
from .config import reduce_file_patterns, accessibility_update_file_patterns, web_config
from .fix_accessibilities import fix_accessibilities_in_folder
import json


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

def run_accessibility_fixer_on_webroot(dry_run: bool = False):
    """Run accessibility fixer on each subfolder in webroot/ig."""
    logger = logging.getLogger()
    webroot_ig = Path.cwd() / 'webroot' / 'ig'
    if not webroot_ig.exists():
        logger.error(f"webroot/ig not found at expected location: {webroot_ig.resolve()}")
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


def write_web_configs(ig_repo_path, dry_run: bool = False):
    """Generate web.config files for the IG and root version."""
    logger = logging.getLogger()
    base_web_config = Path('./webroot/ig/web.config').resolve()
    logger.debug(f"Targeting web config: {base_web_config}")

    pub_req_path = Path(ig_repo_path) / 'publication-request.json'
    
    try:
        with open(pub_req_path, 'r') as file:
            config_data = json.load(file)
    except Exception as e:
        logger.error(f"Failed to read {pub_req_path}: {e}")
        return

    version_web_config = Path(f'./webroot/ig/{config_data["version"]}/web.config').resolve()
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

