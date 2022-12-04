"""Provide ``__version__`` for
`importlib.metadata.version() <https://docs.python.org/3/library/importlib.metadata.html#distribution-versions>`_.
"""
from contextlib import suppress

__all__ = ["__version__", "__version_tuple__"]

try:
    from ._version import __version__, __version_tuple__  # type: ignore
except ImportError:
    __version__ = "rolling"
    __version_tuple__ = (0, 0, 0, __version__, "")

with suppress(ImportError):
    from rich import traceback

    traceback.install()
