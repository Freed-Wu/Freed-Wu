"""Python REPL Specific Code
============================
"""
from contextlib import suppress

with suppress(ImportError):
    import readline

    from jedi.utils import setup_readline

    setup_readline()

with suppress(ImportError):
    import sys

    from translate_shell.utils.misc import (
        p10k_sections,
        section_os,
        section_path,
        section_time,
    )

    class Ps1:
        """Ps1."""

        def __init__(self) -> None:
            """Init."""
            insert_time = " {time}"

            self.sep = ""
            self.insert_text = " {text} "
            self.sections = [
                ("BLACK", "YELLOW", section_os()),
                (
                    "GREEN",
                    "BLACK",
                    f" {sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}",
                ),
                ("WHITE", "BLUE", section_path),
                (
                    "BLACK",
                    "WHITE",
                    lambda: insert_time.format(time=section_time()),
                ),
            ]

        def __str__(self) -> str:
            """Str."""
            prompt = p10k_sections(self.sections, self.insert_text, self.sep)
            return prompt + "\n>>> "

    sys.ps1 = Ps1()

with suppress(ImportError):
    from repl_python_codestats.python import (
        install_hook as install_codestats_hook,
    )

    install_codestats_hook()

with suppress(ImportError):
    from repl_python_wakatime.python import install_hook

    install_hook()
