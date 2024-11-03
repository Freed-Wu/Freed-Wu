#!/usr/bin/env python
r"""Get python version
======================

Or real init script for all python REPLs.
"""

if __name__ == "__main__":
    import sys

    print(f"{sys.version_info[0]}.{sys.version_info[1]}")

else:
    from contextlib import suppress

    from . import my  # noqa: F401

    with suppress(ImportError):
        from rich import print  # noqa: F401

    with suppress(ImportError):
        from translate_shell.tools.repl.main import interact

        interact()
