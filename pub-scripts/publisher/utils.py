"""Small utility helpers and logging configuration used by the publisher CLI.

This module contains lightweight argument validators, a small class of
ANSI color escape codes used for terminal output, and logging configuration.
"""

from pathlib import Path
import os
import logging
import sys


class bcolors:
    """Terminal color escape codes for lightweight status messages."""
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


class ColoredFormatter(logging.Formatter):
    """Custom logging formatter to add colors to console output."""
    FORMATS = {
        logging.DEBUG: bcolors.OKCYAN + "%(levelname)s: %(message)s" + bcolors.ENDC,
        logging.INFO: bcolors.OKGREEN + "%(message)s" + bcolors.ENDC,
        logging.WARNING: bcolors.WARNING + "%(levelname)s: %(message)s" + bcolors.ENDC,
        logging.ERROR: bcolors.FAIL + "%(levelname)s: %(message)s" + bcolors.ENDC,
        logging.CRITICAL: bcolors.BOLD + bcolors.FAIL + "%(levelname)s: %(message)s" + bcolors.ENDC
    }

    def format(self, record):
        log_fmt = self.FORMATS.get(record.levelno, "%(message)s")
        formatter = logging.Formatter(log_fmt)
        return formatter.format(record)


def setup_logging(verbose: bool):
    """Configure the root logger to write to console and a file."""
    logger = logging.getLogger()
    logger.setLevel(logging.DEBUG if verbose else logging.INFO)

    # Console Handler with Color
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setLevel(logging.DEBUG if verbose else logging.INFO)
    console_handler.setFormatter(ColoredFormatter())
    logger.addHandler(console_handler)

    # File Handler
    file_handler = logging.FileHandler('publish.log', encoding='utf-8')
    file_handler.setLevel(logging.DEBUG)  # Always log DEBUG to file
    file_formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    file_handler.setFormatter(file_formatter)
    logger.addHandler(file_handler)

    return logger


def log_milestone(logger, message: str):
    """Log a milestone heading with decoration."""
    logger.info(f"\n{'=' * 50}\n= {message}\n{'=' * 50}")


def log_command(logger, cmd: str):
    """Log a command being executed."""
    logger.info(f"> Executing: {cmd}")


def repo_url_arg(string):
    """Validate a URL-like string for use as the `ig_repo` argument."""
    from validators import url

    if not url(string):
        logging.getLogger().error("URL is not valid: " + string)
    else:
        return string


def output_folder_arg(string):
    """Argparse `type=` helper: ensure the output folder does not already exist."""
    p = Path(string)
    if p.is_dir():
        logging.getLogger().error("Folder already exists: " + string)
    else:
        return string


def output_folder_arg_bypass(string):
    """A passthrough variant for argument parsing when existence should be ignored."""
    return string
