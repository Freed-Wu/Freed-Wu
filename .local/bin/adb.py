#!/usr/bin/env python
"""Expect adb shell."""
import sys
from shlex import join, split

import pexpect

child = pexpect.spawn(join(split("adb shell") + sys.argv[1:]))
child.expect("PBCM10:/ \\$ ")
child.sendline("exec su -l u0_a205")
child.interact()
