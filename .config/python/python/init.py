r"""Init
========

For all REPLs.
"""
import sys
from contextlib import suppress

from python import my
from python.rich import print

del print

if sys.argv == [""]:
    from python._python import sys

with suppress(ImportError):
    import readline
