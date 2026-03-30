import argparse
import time
import os
from pathlib import Path
import shutil

from .gitops import clone_repos
from .builder import (
    run_ig_build,
    run_full_build,
    initialize_output_folder,
)
from .config import IG_PUBLISHER_URL, load_configuration, initialize_templates
from .postprocess import reduce_files, write_web_configs, run_accessibility_fixer_on_webroot
from .utils import repo_url_arg, output_folder_arg



# Suggested improvements:
# - Add a `--dry-run` option to list target folders before making changes.
# - Add logging (instead of prints) and a `--verbose` flag.
# - Consider running accessibility fixes in parallel (careful with CPU/disk IO).\
# - Add error handling around the external script invocation to catch and log any issues without crashing the whole process.
# - Consider adding a summary report at the end of the post-processing steps, including how many files were removed and how many were modified for accessibility.

def main():
    """CLI entrypoint for the publisher package."""
    parser = argparse.ArgumentParser(description="""FHIR IG Publisher - Full Publication Setup Script""")
    parser.add_argument('ig_repo', type=repo_url_arg, help="Path to FHIR IG Repository", nargs='?')
    parser.add_argument('output_path', type=output_folder_arg, help="Output Folder path", nargs='?')
    parser.add_argument('-b', '--branch', help="Repository Branch")
    parser.add_argument('-p', '--pauses', action='store_true', help='Enable pauses (wait for key press) between steps')
    parser.add_argument('-r', '--reduce', action='store_true', help='Reduce output size (postprocess removal of unneeded files)')
    parser.add_argument('-a', '--access', action='store_true', help='Modify files to be more Section 508 accessibility compliant')

    args = parser.parse_args()
    if not (args.ig_repo and args.output_path):
        parser.print_help()
        parser.error('Need a FHIR IG repo and Output folder')

    start = time.time()
    directory_path = Path(args.output_path)

    try:
        directory_path.mkdir()
        print(f"Directory '{directory_path}' created successfully.")
    except FileExistsError:
        print(f"Directory '{directory_path}' already exists.")
    except PermissionError:
        print(f"Permission denied: Unable to create '{directory_path}'.")
    except Exception as e:
        print(f"An error occurred: {e}")

    # change into output folder
    try:
        os.chdir(directory_path)
    except Exception:
        pass
    # clone repos
    ig_repo_path = clone_repos(args.ig_repo, args.branch)

    print("Starting to initialize output folder - " + str(ig_repo_path))
    initialize_output_folder(ig_repo_path, IG_PUBLISHER_URL)

    print("Starting to initialize templates - " + str(ig_repo_path))
    initialize_templates(ig_repo_path=ig_repo_path)

    print("Starting to run IG Build - " + str(ig_repo_path))
    run_ig_build(ig_repo_path=ig_repo_path)

    print("Starting to run full build -")
    run_full_build(publish_path=str(Path('.').parent.resolve()), ig_repo_path=ig_repo_path)

    # TODO, With new IG Publisher, may need to copy the generated version into the webroot/ig folder.

    if args.reduce:
        print(f"Removing excess files")
        reduce_files()

    print(f"Updating web.config files")
    write_web_configs(ig_repo_path=ig_repo_path)

    if args.access:
        print(f"Modifying files to be more Section 508 accessibility compliant")
        #fix_accessibility()
        run_accessibility_fixer_on_webroot()

    end = time.time()
    print("Full execution time (in seconds)", end - start)
