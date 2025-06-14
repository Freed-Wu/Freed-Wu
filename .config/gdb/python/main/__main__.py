#!/usr/bin/env python
r"""Get python version
======================

Or real init script for all python REPLs.
"""

import sys

__version__ = f"{sys.version_info[0]}.{sys.version_info[1]}"

if __name__ == "__main__":
    print(__version__)

else:
    import os
    from contextlib import suppress

    if os.path.isfile("/run/current-system/nixos-version"):
        sys.path.insert(
            2,
            os.path.expanduser(
                f"~/.local/lib/python{__version__}/site-packages"
            ),
        )

    from . import my  # noqa: F401

    with suppress(ImportError):
        from rich import print  # noqa: F401

    # https://github.com/prompt-toolkit/ptpython/issues/546
    is_gdb = False
    with suppress(ImportError):
        from .gdb import gdb  # noqa: F401

        is_gdb = True

    with suppress(ImportError):
        from translate_shell.tools.repl.main import interact

        # https://github.com/davidhalter/jedi/issues/2046
        interact(wakatime=not is_gdb, codestats=not is_gdb, jedi=not is_gdb)
