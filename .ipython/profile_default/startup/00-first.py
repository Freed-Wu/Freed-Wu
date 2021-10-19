"""$PYTHONSTARTUP."""
from rich import print
import sys
if sys.argv[0] == '':
    from rich import pretty
    from rich import traceback
    pretty.install()
    traceback.install()

    import os
    import re
    import getpass
    from datetime import datetime
    import colorama
    from colorama import Fore, Back, Style

    class _Ps1:
        def __init__(self):
            self.n = 0
            if sys.platform == 'windows':
                colorama.init()

            os_name = sys.platform
            if os.access('/etc/lsb-release', os.R_OK):
                with open('/etc/lsb-release') as f:
                    lines = f.read().splitlines()
                lines = list(filter(
                    lambda line: re.search('DISTRIB_ID=', line), lines))
                if len(lines):
                    tokens = lines[0].split('=')
                    if len(tokens) > 1:
                        os_name = tokens[1].lower()
            if os.getenv('PREFIX') == '/data/data/com.termux/files/usr':
                os_name = 'android'

            icons = {
                'linux': '',
                'linux2': '',
                'linux3': '',
                'darwin': '',
                'dos': '',
                'win16': '',
                'win32': '',
                'cygwin': '',
                'msys': '',
                'java': '',
                'android': '',
                'arch': '',
                'gentoo': '',
                'ubuntu': '',
                'cent': '',
                'debian': '',
                'dock': '',
            }
            self.os_icon = icons.get(os_name, '?')

        def __str__(self):
            self.n += 1
            path = os.getcwd()
            if os.access(path, 7):
                path = ' ' + path
            else:
                path = ' ' + path

            return Fore.WHITE + Back.BLUE \
                + datetime.now().strftime('%Y%m%d%T') + Fore.BLUE \
                + Back.RED + '' + Fore.BLACK + Back.RED \
                + getpass.getuser() \
                + Fore.RED + Back.MAGENTA + '' + Fore.BLACK + self.os_icon \
                + Fore.MAGENTA + Back.YELLOW + '' + Fore.BLACK + path \
                + Fore.YELLOW + Back.BLACK + '' + Style.RESET_ALL + '\n' \
                + f'{self.n:2} '

    sys.ps1 = _Ps1()
    sys.ps2 = '--> '
