#!/usr/bin/env python3
"""%HERE%.

usage: {binname} [-hVdv]

options:
    -h, --help                  Show this screen.
    -V, --version               Show version.
    -d, --debug                 Show debug information.
    -v, --verbose               Show verbose information.
"""
from typing import Dict, Final
import logging
import os
import sys
from docopt import docopt

try:
    from . import __version__ as VERSION
except ImportError:
    VERSION: Final = "0.0.1"

BINNAME: Final = os.path.split(sys.argv[0])[1]
_doc: Final = __doc__.format(binname=BINNAME)  # type: ignore
logger = logging.getLogger(__name__)


def main(doc: str = _doc):
    """Run main function.

    :param doc:
    :type doc: str
    """
    try:
        args: Dict[str, str] = docopt(doc, version=VERSION)
    except NameError:
        args = {}
    if args.get("--debug"):
        level = "DEBUG"
    elif args.get("--verbose"):
        level = "INFO"
    else:
        level = "WARNING"
    try:
        from rich.logging import RichHandler

        logging.basicConfig(
            level=level,
            format="%(message)s",
            handlers=[RichHandler(rich_tracebacks=True, markup=True)],
        )
    except ImportError:
        logging.basicConfig(level=level)
    logger.debug(args)

    import torch
    import pytorch_lightning as pl

    pl._logger.setLevel(level)
    pl.seed_everything(42)


if __name__ == "__main__":
    main(_doc)
