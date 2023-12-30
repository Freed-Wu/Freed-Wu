r"""This module can be called by
`python -m <https://docs.python.org/3/library/__main__.html>`_.
"""

from argparse import ArgumentParser, RawDescriptionHelpFormatter
from datetime import datetime

from . import __name__ as NAME
from . import __version__

try:
    import shtab
except ImportError:
    from . import _shtab as shtab

NAME = NAME.replace("_", "-")
VERSION = rf"""{NAME} {__version__}
Copyright (C) {datetime.now().year}
Written by {{ g:snips_author }}
"""
EPILOG = """
Report bugs to <{{ g:snips_email }}>.
"""


def get_parser() -> ArgumentParser:
    r"""Get a parser for unit test."""
    parser = ArgumentParser(
        epilog=EPILOG, formatter_class=RawDescriptionHelpFormatter
    )
    parser.add_argument("--version", version=VERSION, action="version")
    shtab.add_argument_to(parser)
    return parser


def main() -> None:
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
