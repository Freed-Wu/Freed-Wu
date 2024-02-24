r"""Main
========

For all REPLs.
"""

from rich import print  # noqa: F401
from translate_shell.tools.repl.main import interact

from . import my  # noqa: F401

interact()
