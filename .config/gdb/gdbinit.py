"""Source gdb-prompt
====================

``gdb -ex 'python print(gdb.PYTHONDIR)' -ex 'quit'`` show gdb python path.
"""

import os

import gdb  # type: ignore

prefixs = [
    "/usr",
    "/usr/local",
    "/run/current-system/sw",
    "/data/data/com.termux/files/usr",
    "~/.local/state/nix/profile",
]

for prefix in prefixs:
    path = os.path.expanduser(os.path.join(prefix, "bin/gdb-prompt"))
    if os.path.isfile(path):
        gdb.execute("source " + path)
        break

for prefix in prefixs:
    path = os.path.expanduser(os.path.join(prefix, "share/gdb-dashboard/.gdbinit"))
    if os.path.isfile(path):
        gdb.execute("source " + path)
        break

for prefix in prefixs:
    path = os.path.expanduser(os.path.join(prefix, "share/gdb/gdb-hook.py"))
    if os.path.isfile(path):
        gdb.execute(
            f"""define hook-stop
  source {path}
end"""
        )
        break
