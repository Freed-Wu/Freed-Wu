"""$PYTHONSTARTUP."""
import atexit
import logging
import sys
from contextlib import suppress

from python.my import my
from rich import pretty, print, traceback
from rich.logging import RichHandler

if sys.argv == [""]:
    from python._python import sys

pretty.install()
traceback.install()

with suppress(ImportError):
    import readline

    if sys.argv == [""]:
        with suppress(OSError):
            readline.read_history_file()
        atexit.register(readline.write_history_file)
logging.basicConfig(
    format="%(message)s",
    handlers=[RichHandler(rich_tracebacks=True, markup=True)],
)
