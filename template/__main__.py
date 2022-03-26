#! /usr/bin/env python3
"""%HERE%.

usage: {binname} [-hVd]

options:
    -h, --help                  Show this screen.
    -V, --version               Show version.
    -d, --debug                 Show debug information.
"""
from typing import Dict, Final
from pprint import pformat
import logging
import os
import sys
from docopt import docopt
from . import __version__ as VERSION

BINNAME: Final = os.path.split(sys.argv[0])[1]
_doc: Final = __doc__.format(binname=BINNAME)  # type: ignore
logger = logging.getLogger(__name__)


def main(doc: str = _doc):
    """Run main function."""
    try:
        args: Dict[str, str] = docopt(doc, version=VERSION)
    except Exception:
        args = {}
    if args.get("--debug"):
        try:
            from rich.logging import RichHandler

            logging.basicConfig(
                level="DEBUG",
                format="%(message)s",
                handlers=[RichHandler(rich_tracebacks=True, markup=True)],
            )
        except ImportError:
            logging.basicConfig(level="DEBUG")
    logger.debug(pformat(args))


if __name__ == "__main__":
    main(_doc)
