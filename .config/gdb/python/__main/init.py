"""$PYTHONSTARTUP
=================

Wrap ``__main__.py`` to ensure only ``my`` to be imported.
"""

try:
    from __main.__main__ import my
except ImportError:
    import os
    import sys

    sys.path.insert(0, os.path.expanduser("~/.config/gdb/python"))
    from __main.__main__ import my  # noqa: F401

    sys.path.pop(0)
