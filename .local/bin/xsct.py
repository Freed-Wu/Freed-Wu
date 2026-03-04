#!/usr/bin/env python
"""Expect xsct."""
import sys
from shlex import join, split

import pexpect

child = pexpect.spawn(join(split("xsct") + sys.argv[1:]))
child.expect("xsct%")
child.sendline("source ~/.tclshrc")
child.interact()
