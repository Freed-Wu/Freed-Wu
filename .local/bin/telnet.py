#!/usr/bin/env python
"""Expect telnet."""
import pexpect
from keyring import get_keyring

keyring = get_keyring()
password = keyring.get_password("telnet", "admin")
child = pexpect.spawn("telnet 192.168.1.1")
child.expect("tc login: ")
child.sendline("admin")
child.expect("Password: ")
if password:
    child.sendline(password)
child.interact()
