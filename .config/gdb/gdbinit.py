"""Source gdb-prompt
====================

``gdb -ex 'python print(gdb.PYTHONDIR)' -ex 'quit'`` show gdb python path.
"""
import os

import gdb  # type: ignore

paths = [
    "/usr",
    "/usr/local",
    "/run/current-system/sw",
    "/data/data/com.termux/files/usr",
    "~/.local/state/nix/profile"
]

for path in paths:
    file = os.path.expanduser(os.path.join(path, "bin/gdb-prompt"))
    if os.path.exists(file):
        gdb.execute("source " + file)
        break
