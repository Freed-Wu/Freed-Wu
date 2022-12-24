"""$PYTHONSTARTUP."""
import atexit
import logging
import os
import sys
from contextlib import suppress

from python.my import my
from rich import print
from rich.logging import RichHandler

if sys.argv[0] == "":
    from python.python import sys

with suppress(ImportError):
    import readline

    with suppress(OSError):
        readline.read_history_file()
    atexit.register(readline.write_history_file)
logging.basicConfig(
    format="%(message)s",
    handlers=[RichHandler(rich_tracebacks=True, markup=True)],
)
