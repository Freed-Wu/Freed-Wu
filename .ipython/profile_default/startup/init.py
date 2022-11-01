"""$PYTHONSTARTUP."""
import atexit
from contextlib import suppress
import logging
import os
import readline
import sys

from rich import print
from rich.logging import RichHandler

try:
    from startup.my import my
except ImportError:
    sys.path.insert(
        0,
        os.path.dirname(os.path.dirname(os.getenv("PYTHONSTARTUP", __file__))),
    )

    from startup.my import my

if sys.argv[0] == "":
    from startup.python import sys

with suppress(OSError):
    readline.read_history_file()
atexit.register(readline.write_history_file)
logging.basicConfig(
    format="%(message)s",
    handlers=[RichHandler(rich_tracebacks=True, markup=True)],
)
