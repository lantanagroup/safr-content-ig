import glob
import os
from pathlib import Path
from .config import reduce_file_patterns, accessibility_update_file_patterns, web_config
from .fix_accessibilities import fix_accessibilities_in_folder
import json

"""Post-processing helpers for publisher.

Provides functionality for reducing build size, fixing accessibility issues,
and writing web.config files. The accessibility fixes are delegated to the
existing script `ci-scripts/fix_accessibilities.py` so that improvements to that
tool are automatically used.

Usage notes:
- `fix_accessibility()` will locate `ci-scripts/fix_accessibilities.py` (sibling
  to this package) and invoke it for every subfolder under `webroot/ig`.
- The external script is executed with the active Python interpreter (via
  `sys.executable`) to maintain environment consistency.

Suggested improvements:
- Add a `--dry-run` option to list target folders before making changes.
- Add logging (instead of prints) and a `--verbose` flag.
- Consider running accessibility fixes in parallel (careful with CPU/disk IO).
"""

"""This module provides post-processing helpers for the publisher CLI. These include functions to reduce the output size by removing unneeded files,
fix accessibility issues in the generated HTML, and write web.config files for the generated output. The accessibility fixes are delegated to the existing script `ci-scripts/fix_accessibilities.py` so that improvements to that tool are automatically used. The `fix_accessibility()` function will locate `ci-scripts/fix_accessibilities.py` (sibling to this package) and invoke it for every subfolder under `webroot/ig`. The external script is executed with the active Python interpreter (via `sys.executable`) to maintain environment consistency."""

def format_file_size(size_in_bytes: int) -> str:
    """Format a byte count into a human-readable string.

    Args:
        size_in_bytes: File size in bytes.

    Returns:
        A string like '123.45 KB', '1.50 MB', etc.
    """
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

def run_accessibility_fixer_on_webroot():
    """Run `fix_accessibilities.fix_accessibilities_in_folder()` on each subfolder in webroot/ig."""
    webroot_ig = Path.cwd() / 'webroot' / 'ig'
    if not webroot_ig.exists():
        print(f"webroot/ig not found at expected location: {webroot_ig}")
        return

    for entry in sorted(webroot_ig.iterdir()):
        if entry.is_dir():
            target_folder = str(entry.resolve())
            print(f"Running accessibility fixer on: {target_folder}")
            try:
                fix_accessibilities_in_folder(target_folder)
            except Exception as e:
                print(f"Failed to run accessibility fixer on {target_folder}: {e}")


def reduce_files():
    """Remove unneeded files from the generated output to reduce size.
    The list of file patterns to remove is defined in `reduce_file_patterns` in the config module. This function iterates through those patterns, finds matching files under `webroot/ig`, and deletes them while keeping a running total of the file size removed. At the end, it prints the total size of files removed in a human-readable format."""

    file_size_bytes = 0
    for pattern in reduce_file_patterns:
        for filepath in glob.glob('./webroot/ig/' + pattern, recursive=True):
            print("Removing file: " + filepath)
            file_size_bytes = file_size_bytes + os.path.getsize(filepath)
            os.remove(filepath)

    print("Total File Size Removed: " + str(format_file_size(file_size_bytes)))


def replace_strings_in_file(filepath, old_string, new_string):
    """Replace occurrences of old_string with new_string in the specified file.
    Args:       filepath: Path to the file to modify.
                old_string: A string or list of strings to be replaced.
                new_string: A string or list of strings to replace with (must correspond in length to old_string if it's a list).
    This function reads the content of the specified file, replaces all occurrences of old_string with new_string, and writes the modified content back to the file. It includes error handling for file not found and other exceptions, and prints out any errors encountered during the process."""
    
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
        print(f"Error: File '{filepath}' not found.")
    except Exception as e:
        print(f"An error occurred: {e} in file {filepath}")


# def fix_accessibility():
#     for pattern in accessibility_update_file_patterns:
#         for filepath in glob.glob('./webroot/ig/' + pattern, recursive=True):
#             print("Updating file for Section 508 compliance: " + filepath)
#             from .config import accessibility_old_string, accessibility_new_string
#             replace_strings_in_file(filepath, accessibility_old_string, accessibility_new_string)


def write_web_configs(ig_repo_path):
    base_web_config = str(Path('./webroot/ig/web.config').resolve())
    print(base_web_config)

    with open(str(ig_repo_path) + '/publication-request.json', 'r') as file:
        config_data = json.load(file)

    version_web_config = str(Path('./webroot/ig/' + config_data['version'] + "/web.config").resolve())
    print(version_web_config)

    if Path(base_web_config).is_file():
        os.remove(base_web_config)

    with open(base_web_config, "w+") as web_config_file:
        web_config_file.write(web_config)

    if Path(version_web_config).is_file():
        os.remove(version_web_config)

    with open(version_web_config, "w+") as web_config_file:
        web_config_file.write(web_config)
