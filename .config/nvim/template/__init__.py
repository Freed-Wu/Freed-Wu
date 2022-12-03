"""Provide ``__version__`` for
`importlib.metadata.version() <https://docs.python.org/3/library/importlib.metadata.html#distribution-versions>`_.
"""
from contextlib import suppress

__all__ = ["__version__", "version_tuple"]

from ._version import version as __version__, version_tuple

with suppress(ImportError):
    from rich import traceback

    traceback.install()
