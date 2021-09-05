import sys
import os
from datetime import datetime
import colorama
from colorama import Fore, Back, Style
from rich import print
from rich import pretty
from rich import traceback

pretty.install()
traceback.install()


class Ps1:
    def __init__(self):
        if sys.platform == 'windows':
            colorama.init()
        if os.environ.get('PREFIX') == '/data/data/com.termux/files/usr':
            self.os_icon = ''
        else:
            self.os_icon_dict = {'linux': '', 'darwin': '', 'windows': ''}
            self.os_icon = self.os_icon_dict[sys.platform]

    def __str__(self):
        return Fore.WHITE + Back.BLUE \
            + datetime.now().strftime('%Y%m%d%T') + Fore.BLUE \
            + Back.RED + '' + Fore.BLACK + Back.RED \
            + os.environ.get('USER', '') \
            + Fore.RED + Back.MAGENTA + '' + Fore.BLACK + self.os_icon \
            + Fore.MAGENTA + Back.YELLOW + '' + Fore.BLACK + os.getcwd() \
            + Fore.YELLOW + Back.BLACK + '' + Style.RESET_ALL + '\n' + '❯❯❯ '

sys.ps1 = Ps1()
sys.ps2 = Fore.MAGENTA + '██ ' + Style.RESET_ALL
