"""$PYTHONSTARTUP
=================
"""
import logging
import os
import sys
from contextlib import suppress

from rich import pretty, print, traceback
from rich.logging import RichHandler

path = os.path.expanduser("~/.config/python")
if path not in set(sys.path):
    sys.path.insert(1, path)
del path
from python import my

if sys.argv == [""]:
    from python._python import sys

pretty.install()
traceback.install()

with suppress(ImportError):
    import readline

logging.basicConfig(
    format="%(message)s",
    handlers=[RichHandler(rich_tracebacks=True, markup=True)],
)
