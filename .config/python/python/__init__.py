"""$PYTHONSTARTUP
=================

Only import ``my``.
"""
try:
    from python.init import my
except ImportError:
    import os
    import sys

    sys.path.insert(
        1,
        os.path.expanduser(
            f"~/.local/lib/python{sys.version_info.major}.{sys.version_info.minor}/site-packages"
        ),
    )
    sys.path.insert(1, os.path.expanduser("~/.config/python"))
    from python.init import my

    sys.path.pop(1)
