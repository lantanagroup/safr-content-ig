"""Git helper functions.

This module provides simple git-related helpers used by the CLI. It is a
minimal wrapper around the system `git` command; for more robust usage
consider replacing these calls with `GitPython` or explicit
`subprocess.run(..., check=True)` invocations.
"""

import subprocess
from pathlib import Path
from .config import pub_repos


def _run(cmd: str) -> None:
    """Run a shell command and raise on non-zero exit.

    This thin wrapper centralises subprocess invocation so callers get a
    clear RuntimeError on failure instead of silently continuing.
    """
    res = subprocess.run(cmd, shell=True)
    if res.returncode != 0:
        raise RuntimeError(f"Command failed: {cmd}")


def clone_repos(ig_repo: str, branch: str | None):
    """Clone the IG repository and supporting publication repos.

    Args:
        ig_repo: URL of the IG repository to clone.
        branch: Optional branch name to checkout for the IG repo.

    Returns:
        Path object pointing at the cloned IG repo directory (first created
        entry in the current working directory).

    Notes:
        - This function currently uses `os.system` to shell out to `git` to
          preserve the original script behaviour. Replacing with
          `subprocess.run(..., check=True)` is recommended for better error
          handling.
    """
    print("Cloning FHIR IG repo: " + ig_repo)
    if branch is None:
        _run(f"git clone {ig_repo}")
        print(f"Cloned: git clone {ig_repo}")
    else:
        _run(f"git clone -b {branch} --single-branch {ig_repo}")
        print(f"Cloned: git clone {ig_repo} -b {branch}")

    # Get the path of the first created directory (assumes clone created one entry)
    ig_repo_path = list(Path('.').iterdir())[0]

    # Clone supporting pub repos (history + registry). These are best-effort
    # operations: a failure here should not abort the whole publish process.
    for key, value in pub_repos.items():
        print(f"Cloning {key} repo: {value}")
        try:
            _run(f"git clone {value} {key}")
        except RuntimeError:
            print(f"Warning: could not clone {key}; continuing")

    return ig_repo_path
