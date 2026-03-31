"""Small utility helpers used by the publisher CLI.

This module contains lightweight argument validators and a small class of
ANSI color escape codes used for terminal output. The validators are
intended to be used with `argparse` `type=` parameters; they perform
simple checks and print a message on failure.
"""

from pathlib import Path


class bcolors:
    """Terminal color escape codes for lightweight status messages.

    These are convenience constants and not required for functionality.
    """
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def repo_url_arg(string):
    """Validate a URL-like string for use as the `ig_repo` argument.

    This is intentionally lightweight: it uses the `validators` package to
    confirm the input looks like a URL. On invalid input the function prints
    a message and returns None (so argparse will treat it as an invalid
    value). Return the original string on success.
    """
    from validators import url

    if not url(string):
        print("URL is not valid: " + string)
    else:
        return string


def output_folder_arg(string):
    """Argparse `type=` helper: ensure the output folder does not already exist.

    Returns the string when the path does not exist; prints a message and
    returns None when the folder already exists. This mirrors the behavior of
    the original script and allows `argparse` to reject the value.
    """
    p = Path(string)
    if p.is_dir():
        print("Folder already exists: " + string)
    else:
        return string


def output_folder_arg_bypass(string):
    """A passthrough variant for argument parsing when existence should be ignored."""
    return string
