r"""Main
========

For all REPLs.
"""

from contextlib import suppress

from . import my  # noqa: F401

with suppress(ImportError):
    from rich import print  # noqa: F401

with suppress(ImportError):
    from translate_shell.tools.repl.main import interact

    interact()
