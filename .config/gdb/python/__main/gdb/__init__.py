"""Source gdb-prompt
====================

``gdb -ex 'python print(gdb.PYTHONDIR)' -ex 'quit'`` show gdb python path.
"""

import os
import sys
from contextlib import suppress

import gdb

from ..__main__ import __version__

with suppress(ImportError):
    from gdb import cuda  # noqa: F401

    path = os.path.expanduser(
        f"~/.local/lib/python{__version__}/site-packages"
    )
    if os.path.isdir(path):
        sys.path.insert(1, path)

path = f"/run/current-system/sw/lib/python{__version__}/site-packages"
if os.path.isdir(path):
    sys.path.insert(-1, path)

with suppress(ImportError):
    from pyrime.ptpython.gdb import PtPythonCommand

    PtPythonCommand()

with suppress(ImportError):
    # Error occurred in Python: '_GdbFile' object has no attribute 'fileno'
    # from repl_python_wakatime.backends.codestats import CodeStats
    from repl_python_wakatime.backends.wakatime import Wakatime
    from repl_python_wakatime.frontends.gdb import StopHook

    StopHook(Wakatime())


prefixs = {
    "/usr",
    "/usr/local",
    "/run/current-system/sw",
    "/data/data/com.termux/files/usr",
    "~/.local/state/nix/profile",
}

for prefix in prefixs:
    for name in {".gdbinit", "gdbinit"}:
        path = os.path.expanduser(
            os.path.join(prefix, "share/gdb-dashboard/" + name)
        )
        if os.path.isfile(path):
            gdb.execute("source " + path)
            break
