"""$PYTHONSTARTUP
=================

Only import ``my``.
"""
try:
    from python.__main__ import my
except ImportError:
    import os
    import sys

    sys.path.insert(1, os.path.expanduser("~/.config/python"))
    from python.__main__ import my

    sys.path.pop(1)
