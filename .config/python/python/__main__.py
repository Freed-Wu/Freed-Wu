r"""Init
========

For all REPLs.
"""
from rich import print
from translate_shell.tools.repl.main import interact

# https://github.com/NixOS/nixpkgs/issues/241660
from translate_shell.utils.section import section_os

from . import my

interact(codestats=section_os() != "nixos")
