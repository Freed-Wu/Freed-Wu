"""
This file shows how you can define a custom shell for PuDB. This is the
shell used when pressing the ! key in the debugger (it does not affect the
Ctrl-x shell that is built into PuDB).

To create a custom shell, create a file like this one with a function called
pudb_shell(_globals, _locals) defined at the module level. Note
that the file will be executed.

Then, go to the PuDB preferences window (type Ctrl-p inside of PuDB) and add
the path to the file in the "Custom" field under the "Shell" heading.
"""

import logging
import os

from pudb.shell import run_ptpython_shell

logger = logging.getLogger(__name__)


def pudb_shell(_globals: dict, _locals: dict) -> None:
    """
    Define this a function with this name and signature at the module level.

    This example shell runs a classic Python shell. It is based on
    run_classic_shell in pudb.shell.
    """
    pythonstartup = os.getenv("PYTHONSTARTUP", os.devnull)
    try:
        with open(pythonstartup) as f:
            code = f.read()
        exec(code, _globals, _locals)  # nosec: B102
    except Exception as e:
        logger.warning("skip $PYTHONSTARTUP due to " + " ".join(e.args))
    run_ptpython_shell(_globals, _locals)
