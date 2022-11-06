"""``%DIR%/__init__.py``."""
from contextlib import suppress
import logging

__all__ = ["__version__", "version_tuple"]
logger = logging.getLogger(__name__)

from ._version import version as __version__, version_tuple

with suppress(ImportError):
    from rich import traceback

    traceback.install()
