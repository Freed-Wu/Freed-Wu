#!/usr/bin/env python
r"""{binname}.

Usage: {binname} [options]

Options:
    -q, --quiet                         Don't show normal information.
    -d, --debug                         Show debug information.

Report bugs to <{{ g:snips_email }}>.
"""

import logging
import os
import sys
from contextlib import suppress
from typing import Final

with suppress(ImportError):
    # for debug
    import pudb

    os.environ["PYTHONBREAKPOINT"] = "pudb.set_trace"
    del pudb
    from pathlib import Path

    # avoid warning
    os.makedirs(os.path.expanduser("~/.config/ptpython"), exist_ok=True)
    Path(os.path.expanduser("~/.config/ptpython/config.py")).touch()

try:
    # when this file is __main__.py
    from . import __version__  # type: ignore
except ImportError:
    __version__: Final = "0.0.1"

__all__ = ["get_parser", "VERSION"]
logger: Final = logging.getLogger(__name__)
VERSION: Final = r"""{version}
Copyright (C) {{ strftime('%Y') }}
Written by {{ g:snips_author }}
""".format(
    version=__version__
)


def get_parser(prog=None):
    r"""Get parser for test."""
    from argopt import argopt

    if prog is None:
        prog = os.path.basename(sys.argv[0])
    BINNAME: Final = prog
    DOC: Final = __doc__.format(binname=BINNAME)  # type: ignore
    parser = argopt(DOC, version=VERSION)
    with suppress(ImportError):
        import shtab

        shtab.add_argument_to(parser)
    return parser


def main():
    r"""Parse options, environments, configs."""
    parser = get_parser()
    args = parser.parse_args()
    if args.debug:
        args.level = "DEBUG"
    elif args.quiet:
        args.level = "WARNING"
    else:
        args.level = "INFO"
    try:
        from rich.logging import RichHandler

        logging.basicConfig(
            level=args.level,
            format="%(message)s",
            handlers=[RichHandler(rich_tracebacks=True, markup=True)],
        )
    except ImportError:
        logging.basicConfig(level=args.level)
    del args.debug, args.quiet  # type: ignore
    logger.debug(args)
    # {% here %}


if __name__ == "__main__":
    main()
