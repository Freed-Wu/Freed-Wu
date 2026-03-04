"""$PYTHONSTARTUP
=================

Only import ``my``.
"""
try:
    from python.init import my
except ImportError:
    import os
    import sys

    sys.path.insert(1, os.path.expanduser("~/.config/python"))
    from python.init import my

    sys.path.pop(1)
