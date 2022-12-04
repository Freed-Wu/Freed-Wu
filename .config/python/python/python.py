"""Run when ``python`` not ``ptpython``."""
import os
import platform
import sys
from contextlib import suppress
from datetime import datetime
from pathlib import Path

import colorama
from colorama import Back, Fore, Style
from jedi.utils import setup_readline
from rich import pretty, traceback

colorama.init()
pretty.install()
traceback.install()
setup_readline()


class _Ps1:
    """_Ps1."""

    def __init__(self):
        """__init__."""
        try:
            # python 3.10 support platform.freedesktop_os_release()
            os_name = platform.freedesktop_os_release().get("ID", "")
        except AttributeError:
            os_name = ""
        except OSError:
            if os.getenv("PREFIX") == "/data/data/com.termux/files/usr":
                os_name = "android"
            else:
                os_name = sys.platform

        icons = {
            "linux": "",
            "linux2": "",
            "linux3": "",
            "hurd": "",
            "darwin": "",
            "dos": "",
            "win16": "",
            "win32": "",
            "cygwin": "",
            "java": "",
            "android": "",
            "arch": "",
            "gentoo": "",
            "ubuntu": "",
            "cent": "",
            "debian": "",
            "dock": "",
        }
        self.os_icon = icons.get(os_name, "?")

    def __str__(self):
        """__str__."""
        cwd = os.getcwd()
        if os.access(cwd, 7):
            logo = "  "
        else:
            logo = "  "
        with suppress(ValueError):
            cwd = str(Path(cwd).relative_to(Path.home()))
            if cwd == ".":
                cwd = "~"
            else:
                cwd = "~/" + cwd
        head, mid, tail = cwd.rpartition("/")
        return (
            Fore.BLACK
            + Back.YELLOW
            + " "
            + self.os_icon
            + " "
            + Fore.YELLOW
            + Back.BLACK
            + ""
            + Fore.GREEN
            + "  "
            + ".".join(
                map(
                    str,
                    [
                        sys.version_info.major,
                        sys.version_info.minor,
                        sys.version_info.micro,
                    ],
                )
            )
            + " "
            + Fore.BLACK
            + Back.BLUE
            + ""
            + Fore.WHITE
            + logo
            + head
            + mid
            + Style.BRIGHT
            + tail
            + " "
            + Style.RESET_ALL
            + Fore.BLUE
            + Back.WHITE
            + ""
            + Fore.BLACK
            + "  "
            + datetime.now().strftime("%T")
            + " "
            + Fore.WHITE
            + Back.RESET
            + ""
            + Style.RESET_ALL
            + "\n"
            + ">>> "
        )


sys.ps1 = _Ps1()
