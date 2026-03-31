"""Publisher package.

This package provides a modular refactor of the legacy `go-publisher.py` script.
Import `main` from `publisher.cli` to run the command-line workflow.
"""

from .cli import main

__all__ = ["main"]
