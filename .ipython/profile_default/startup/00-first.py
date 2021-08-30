import sys
import os
from datetime import datetime
import colorama
from colorama import Fore, Back, Style
from rich import print
from rich import pretty
from rich import traceback

os.environ['PYTHONBREAKPOINT'] = 'pudb.forked.set_trace'

if sys.platform == 'windows':
    colorama.init()
pretty.install()
traceback.install()
sys.ps1 = \
    Fore.WHITE + Back.BLUE + datetime.now().strftime('%w%Y%m%d%T') + \
    Fore.BLUE + Back.RED + '' + Fore.BLACK + Back.RED + \
    sys.executable + Fore.RED + Back.GREEN + '' + Fore.BLACK + \
    os.environ.get('USER') + Fore.GREEN + Back.MAGENTA + '' + Fore.BLACK + \
    {'linux': '', 'darwin': '', 'windows': ''}[sys.platform] + \
    Fore.MAGENTA + Back.YELLOW + '' + Fore.BLACK + \
    os.getcwd() + Fore.YELLOW + Back.BLACK + '' + Style.RESET_ALL + '\n' + \
    '❯❯❯ '
sys.ps2 = Fore.MAGENTA + '██ ' + Style.RESET_ALL
