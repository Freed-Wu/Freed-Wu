#!/usr/bin/env python
"""Expect vivado."""
import sys
from shlex import join, split

import pexpect

child = pexpect.spawn(
    join(
        split("vivado -mode tcl -journal /tmp/vivado.jou -log /tmp/vivado.log")
        + sys.argv[1:]
    )
)
child.expect("Vivado%")
child.sendline("source ~/.tclshrc -notrace")
child.interact()
