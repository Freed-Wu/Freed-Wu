#!/usr/bin/env python
"""{binname}.

Usage: {binname} [options]

Options:
    -q, --quiet                         Don't show normal information.
    -d, --debug                         Show debug information.

Report bugs to <%MAIL%>.
"""
from contextlib import suppress
from typing import Final
import logging
import os
import sys
from argopt import argopt

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

VERSION: Final = """{version}
Copyright (C) %YEAR%
Written by %USER%
""".format(
    version=__version__
)
BINNAME: Final = os.path.split(sys.argv[0])[1]
_doc: Final = __doc__.format(binname=BINNAME)  # type: ignore
logger = logging.getLogger(__name__)


def main(doc: str = _doc):
    """Parse options, environments, configs.

    :param doc:
    :type doc: str
    """
    args = argopt(doc, version=VERSION).parse_args()
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
    del args.debug, args.quiet
    logger.debug(args)
    # %HERE%


if __name__ == "__main__":
    main(_doc)
