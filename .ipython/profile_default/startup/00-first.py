import sys
import os
import datetime
import colorama
from rich import pretty
pretty.install()
colorama.init(autoreset=True)
sys.ps1 = '{0}{d}{1}{t}{2}{s}{3}{u}{4}{h}{5}{w}{6}{sharp}{7}{dollar}{8}'.format(
    colorama.Fore.LIGHTBLACK_EX,
    ' ',
    colorama.Fore.LIGHTRED_EX + ' ',
    colorama.Fore.LIGHTGREEN_EX + ' ',
    colorama.Fore.LIGHTYELLOW_EX + '@' + colorama.Fore.LIGHTBLUE_EX,
    colorama.Fore.LIGHTMAGENTA_EX + ':' + colorama.Fore.LIGHTCYAN_EX,
    colorama.Fore.LIGHTWHITE_EX + '\n',
    '',
    ' ',
    d = datetime.datetime.now().strftime('%Y-%m-%d'),
    t = datetime.datetime.now().strftime('%H-%M-%S'),
    s = sys.executable,
    u = os.environ.get('USER'),
    h = 'localhost',
    w = os.getcwd(),
    sharp = '',
    dollar = '$',
)
