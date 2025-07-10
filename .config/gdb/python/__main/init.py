"""$PYTHONSTARTUP
=================

Wrap ``__main__.py`` to ensure only ``my`` to be imported.
"""

try:
    from __main.__main__ import my
except ImportError:
    import contextlib

    @contextlib.contextmanager
    def _add_to_sys_path(path):
        r"""Copied from ``torch.hub``"""
        import os
        import sys

        path = os.path.expanduser(path)
        sys.path.insert(0, path)
        try:
            yield
        finally:
            sys.path.remove(path)

    with _add_to_sys_path("~/.config/gdb/python"):
        from __main.__main__ import my  # noqa: F401
