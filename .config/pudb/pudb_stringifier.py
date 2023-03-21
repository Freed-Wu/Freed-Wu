r"""Pudb Stringifier
====================
"""
from typing import Any

from pudb.var_view import default_stringifier


def pudb_stringifier(obj: Any) -> Any:
    """Pudb stringifier.

    :param obj:
    :type obj: Any
    :rtype: Any
    """
    try:
        from python.describe import describe

        return describe(obj)
    except ImportError:
        return default_stringifier(obj)
