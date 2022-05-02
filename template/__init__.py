# noqa: D400
"""
%HERE%

Common functions.
"""
from typing import Final

__version__: Final = "0.0.1"
try:
    from rich import traceback

    traceback.install()
except ImportError:
    pass
