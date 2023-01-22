#!/usr/bin/env python
r"""This module can be called by
`python -m <https://docs.python.org/3/library/__main__.html>`_.
"""
from argparse import ArgumentParser, RawDescriptionHelpFormatter
from datetime import datetime

from . import __version__

try:
    import shtab
except ImportError:
    from . import _shtab as shtab

VERSION = rf"""%DIR% {__version__}
Copyright (C) {datetime.now().year}
Written by %USER%
"""
EPILOG = """
Report bugs to <%MAIL%>.
"""


def get_parser():
    r"""Get a parser for unit test."""
    parser = ArgumentParser(
        "%DIR%", epilog=EPILOG, formatter_class=RawDescriptionHelpFormatter
    )
    parser.add_argument("--version", version=VERSION, action="version")
    shtab.add_argument_to(parser)
    return parser


def main():
    r"""Parse arguments and provide shell completions."""
    parser = get_parser()
    args = parser.parse_args()

    if args.text:
        from .ui.cli import run
    else:
        from .ui.repl import run
    run(args)


if __name__ == "__main__":
    main()
