#!/usr/bin/env python
"""Expect adb shell."""
import pexpect

child = pexpect.spawn("adb shell")
child.expect("PBCM10:/ \\$ ")
child.sendline("exec su -l u0_a205")
child.interact()
