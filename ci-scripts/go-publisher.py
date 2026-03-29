"""CLI entrypoint kept for backward compatibility.

This script delegates to the modular `publisher` package.
"""
from publisher.cli import main


if __name__ == '__main__':
    main()
