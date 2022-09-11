# noqa: D400
"""
%HERE%

Common functions.
"""
from contextlib import suppress

try:
    from get_version import get_version

    __version__ = get_version(__file__)
    del get_version
except ImportError:
    __version__ = "0.0.1"

with suppress(ImportError):
    from rich import traceback

    traceback.install()
    del traceback
