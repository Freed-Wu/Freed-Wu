"""``startup/__init__.py``."""
from contextlib import suppress

__all__ = ["__version__"]

try:
    from get_version import get_version, NoVersionFound

    try:
        __version__ = get_version(__file__)
    except NoVersionFound:
        __version__ = "0.0.0"
except ImportError:
    __version__ = "0.0.0"

with suppress(ImportError):
    from rich import traceback

    traceback.install()
