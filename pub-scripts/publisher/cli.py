import argparse
import time
import os
import logging
from pathlib import Path
import shutil
import json

from .gitops import clone_repos
from .builder import (
    run_ig_build,
    run_full_build,
    initialize_output_folder,
    initialize_config_data,
    initialize_publication_version
)
from .config import IG_PUBLISHER_URL, load_configuration, initialize_templates
from .postprocess import reduce_files, write_web_configs, run_accessibility_fixer_on_webroot #, update_ig_suite_feeds
from .utils import repo_url_arg, output_folder_arg, output_folder_arg_bypass, setup_logging, log_milestone


def pause(enable: bool):
    if enable:
        input(f"\n[PAUSE] Press Enter to continue...\n")

def main():
    """CLI entrypoint for the publisher package."""
    parser = argparse.ArgumentParser(description="""FHIR IG Publisher - Full Publication Setup Script""")
    parser.add_argument('ig_repo', type=repo_url_arg, help="Path to FHIR IG Repository", nargs='?')
    #parser.add_argument('output_path', type=output_folder_arg, help="Output Folder path", nargs='?')
    parser.add_argument('output_path', type=output_folder_arg_bypass, help="Output Folder path", nargs='?')
    parser.add_argument('-b', '--branch', help="Repository Branch")
    parser.add_argument('-p', '--pauses', action='store_true', help='Enable pauses (wait for key press) between steps')
    parser.add_argument('-r', '--reduce', action='store_true', help='Reduce output size (postprocess removal of unneeded files)')
    parser.add_argument('-a', '--access', action='store_true', help='Modify files to be more Section 508 accessibility compliant')
    parser.add_argument('-v', '--verbose', action='store_true', help='Enable DEBUG level logging')
    parser.add_argument('--dry-run', action='store_true', help='Simulate operations where possible and skip time-consuming operations')

    args = parser.parse_args()
    if not (args.ig_repo and args.output_path):
        parser.print_help()
        parser.error('Need a FHIR IG repo and (not yet existing) Output folder')

    logger = setup_logging(args.verbose)
    
    start = time.time()
    directory_path = Path(args.output_path)

    log_milestone(logger, "Initialization")
    logger.info(f"Target repository: {args.ig_repo}")
    logger.info(f"Target output path: {directory_path.resolve()}")
    if args.dry_run:
        logger.info("[DRY RUN] Simulating filesystem changes where possible.")

    try:
        directory_path.mkdir(exist_ok=True)
        logger.info(f"Directory '{directory_path}' ensured.")
    except Exception as e:
        logger.error(f"An error occurred creating directory: {e}")
        return

    # change into output folder
    try:
        os.chdir(directory_path)
    except Exception as e:
        logger.error(f"Could not change into output directory: {e}")
        return

    # Testing area (Test new features in an existing run, or test features in isolation by enabling/disabling steps here)
    
    # End testing area


    pause(args.pauses)
    
    log_milestone(logger, "Git Operations")
    ig_repo_path = clone_repos(args.ig_repo, args.branch, dry_run=args.dry_run)


    log_milestone(logger, "Initialize in memory config data from IG repo")
    config_data = initialize_config_data(ig_repo_path)
    pause(args.pauses)
    

    log_milestone(logger, "Output Folder Initialization")
    initialize_output_folder(ig_repo_path, IG_PUBLISHER_URL, dry_run=args.dry_run)

    pause(args.pauses)

    log_milestone(logger, "Publication Version Initialization")
    initialize_publication_version(ig_repo_path=ig_repo_path, dry_run=args.dry_run)

    pause(args.pauses)

    log_milestone(logger, "Template Initialization")
    initialize_templates(ig_repo_path=ig_repo_path)


    pause(args.pauses)

    log_milestone(logger, "Running IG Build (Initial/CQF Tooling)")
    run_ig_build(ig_repo_path=ig_repo_path, dry_run=args.dry_run)

    pause(args.pauses)

    log_milestone(logger, "Running Full Versioned IG Build (-go-publish)")
    run_full_build(publish_path=str(Path('.').resolve()), ig_repo_path=ig_repo_path, dry_run=args.dry_run)

    pause(args.pauses)

    if args.reduce:
        log_milestone(logger, "Post-process: File Reduction")
        reduce_files(dry_run=args.dry_run)
        pause(args.pauses)

    log_milestone(logger, "Post-process: Writing web.config")
    write_web_configs(ig_repo_path=ig_repo_path, publish_path=config_data['publish-path'], dry_run=args.dry_run)
    pause(args.pauses)

    log_milestone(logger, "Post-process: Update IG Suite Feeds")
    #update_ig_suite_feeds(webroot_path=directory_path.joinpath('webroot'), ig_repo_path=ig_repo_path)
    pause(args.pauses)

    if args.access and not args.dry_run:
        log_milestone(logger, "Post-process: Accessibility Modifications")
        run_accessibility_fixer_on_webroot(publish_path=config_data['publish-path'], dry_run=args.dry_run)
        pause(args.pauses)



    log_milestone(logger, "Publication Setup Complete")
    end = time.time()
    logger.info(f"Full execution time: {end - start:.2f} seconds; {(end - start)/60:.2f} minutes")
