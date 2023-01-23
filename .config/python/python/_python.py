"""Python REPL Specific Code
============================
"""
import os
import platform
import sys
from contextlib import suppress
from datetime import datetime
from pathlib import Path

from colorama import Back, Fore, Style, init

init()

with suppress(ImportError):
    import readline

    from jedi.utils import setup_readline

    setup_readline()


class Ps1:
    """Ps1."""

    def __init__(self) -> None:
        """__init__."""
        os_name = sys.platform
        if os_name.startswith("linux"):
            try:
                # python 3.10 support platform.freedesktop_os_release()
                os_name = platform.freedesktop_os_release().get("ID", "")
            except AttributeError:
                pass
            except OSError:
                if os.getenv("PREFIX") == "/data/data/com.termux/files/usr":
                    os_name = "android"

        icons = {
            "emscripten": "ﰍ",
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
        }
        self.os_icon = icons.get(os_name, "?")

    def __str__(self) -> str:
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
            + datetime.now().strftime("%H:%M:%S")
            + " "
            + Fore.WHITE
            + Back.RESET
            + ""
            + Style.RESET_ALL
            + "\n"
            + ">>> "
        )


sys.ps1 = Ps1()

with suppress(ImportError):
    from repl_python_codestats.python import (
        install_hook as install_codestats_hook,
    )

    install_codestats_hook()

with suppress(ImportError):
    from repl_python_wakatime.python import install_hook

    install_hook()
