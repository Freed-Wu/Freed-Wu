r"""Pudb Stringifier
====================
"""

import logging
import os
from typing import Any

from pudb.var_view import default_stringifier

logger = logging.getLogger(__name__)


def pudb_stringifier(obj: Any) -> Any:
    """Pudb stringifier.

    :param obj:
    :type obj: Any
    :rtype: Any
    """
    pythonstartup = os.getenv("PYTHONSTARTUP", os.devnull)
    try:
        with open(pythonstartup) as f:
            code = f.read()
        exec(code)  # nosec: B102
    except Exception as e:
        logger.warning("skip $PYTHONSTARTUP due to " + " ".join(e.args))
    try:
        from __main.describe import describe

        return describe(obj)
    except ModuleNotFoundError:
        return default_stringifier(obj)
