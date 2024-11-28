"""Source gdb-prompt
====================

``gdb -ex 'python print(gdb.PYTHONDIR)' -ex 'quit'`` show gdb python path.
"""

import os
import sys

import gdb  # type: ignore

path = "/run/current-system/sw/lib/python3.12/site-packages"
if os.path.isdir(path):
    sys.path.insert(-1, path)

prefixs = {
    "/usr",
    "/usr/local",
    "/run/current-system/sw",
    "/data/data/com.termux/files/usr",
    "~/.local/state/nix/profile",
}

for prefix in prefixs:
    path = os.path.expanduser(os.path.join(prefix, "bin/gdb-prompt"))
    if os.path.isfile(path):
        gdb.execute("source " + path)
        break

for prefix in prefixs:
    for name in {".gdbinit", "gdbinit"}:
        path = os.path.expanduser(
            os.path.join(prefix, "share/gdb-dashboard/" + name)
        )
        if os.path.isfile(path):
            gdb.execute("source " + path)
            break

for prefix in prefixs:
    path = os.path.expanduser(os.path.join(prefix, "share/gdb/gdb-hook.py"))
    if os.path.isfile(path):
        gdb.execute(f"""define hook-stop
  source {path}
end""")
        break
