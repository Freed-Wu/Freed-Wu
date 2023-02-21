r"""Rich
========
"""
import logging

from rich import pretty, print, traceback
from rich.logging import RichHandler

pretty.install()
traceback.install()
logging.basicConfig(
    format="%(message)s",
    handlers=[RichHandler(rich_tracebacks=True, markup=True)],
)
