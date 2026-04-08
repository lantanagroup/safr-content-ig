"""Git helper functions.

This module provides simple git-related helpers used by the CLI. It uses
`subprocess.run(..., check=True)` for more robust error handling and execution.
"""

import subprocess
from pathlib import Path
import logging
from .config import pub_repos
from .utils import log_command


def _run(cmd: list, dry_run: bool = False, cwd=None) -> None:
    """Run a shell command as a list and dynamically stream output."""
    logger = logging.getLogger()
    cmd_str = " ".join(cmd)
    log_command(logger, cmd_str)
    
    if dry_run:
        logger.info(f"[DRY RUN] Skipping command execution.")
        return

    try:
        process = subprocess.Popen(
            cmd,
            cwd=cwd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            bufsize=1
        )
        
        for line in iter(process.stdout.readline, ''):
            if line.strip():
                logger.info(line.strip('\n'))
                
        process.stdout.close()
        return_code = process.wait()
        
        if return_code != 0:
            raise subprocess.CalledProcessError(return_code, cmd)
            
    except subprocess.CalledProcessError as e:
        logger.error(f"Command failed with exit code {e.returncode}: {cmd_str}")
        raise RuntimeError(f"Command failed with exit code {e.returncode}: {cmd_str}")


def clone_repos(ig_repo: str, branch: str | None, dry_run: bool = False) -> Path:
    """Clone the IG repository and supporting publication repos.

    Args:
        ig_repo: URL of the IG repository to clone.
        branch: Optional branch name to checkout for the IG repo.
        dry_run: Whether to simulate execution.

    Returns:
        Path object pointing at the cloned IG repo directory.
    """
    logger = logging.getLogger()
    logger.info(f"Cloning FHIR IG repo: {ig_repo}")
    
    ig_repo_name = ig_repo.rstrip('/').split('/')[-1]
    if ig_repo_name.endswith('.git'):
        ig_repo_name = ig_repo_name[:-4]

    if not ig_repo_name:
        ig_repo_name = "ig-repo" # Fallback if URL parsing fails
        
    ig_repo_path = Path(ig_repo_name)

    # Note: We execute clone even in dry-run if the folder doesn't exist to allow
    # subsequent steps that check directory contents to pass.
    # However, since the user asked NOT to bypass git clones on dry_run:
    cmd_is_dry = False # Always force clone for dry_run as per user instruction

    if ig_repo_path.exists():
        logger.warning(f"Repository folder '{ig_repo_name}' already exists. Skipping clone.")
    else:
        if branch is None:
            _run(["git", "clone", ig_repo, ig_repo_name], dry_run=cmd_is_dry)
        else:
            _run(["git", "clone", "-b", branch, "--single-branch", ig_repo, ig_repo_name], dry_run=cmd_is_dry)
        logger.info(f"Successfully cloned IG repo to {ig_repo_name}")

    # Clone supporting pub repos (history + registry). These are best-effort
    # operations: a failure here should not abort the whole publish process.
    for key, value in pub_repos.items():
        logger.info(f"Cloning pub repo {key} from {value}")
        target_path = Path(key)
        if target_path.exists():
            logger.warning(f"Repo folder '{key}' already exists. Skipping.")
            continue
        try:
            _run(["git", "clone", value, key], dry_run=cmd_is_dry)
        except RuntimeError:
            logger.warning(f"Could not clone {key}; continuing as this is best-effort.")

    return ig_repo_path.resolve()
