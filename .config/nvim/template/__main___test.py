r"""Test %TEST_FILE%"""
from contextlib import suppress

from %DIR2_%.%TEST_FILE%.__main__ import get_parser, VERSION
parser = get_parser("%TEST_FILE%")


class Test:
    r"""Test."""

    @staticmethod
    def test_help(capsys) -> None:
        r"""Test help.

        :param capsys:
        """
        with suppress(SystemExit):
            parser.parse_args(["--help"])
        captured = capsys.readouterr()
        assert captured.out == """\
usage: %TEST_FILE% [-h] [-q] [-d] [-v] [--print-completion {bash,zsh,tcsh}]

%TEST_FILE%.

options:
  -h, --help            show this help message and exit
  -q, --quiet           Don't show normal information.
  -d, --debug           Show debug information.
  -v, --version         show program's version number and exit
  --print-completion {bash,zsh,tcsh}
                        print shell completion script

Report bugs to <%MAIL%>.
"""

    @staticmethod
    def test_version(capsys) -> None:
        r"""Test version.

        :param capsys:
        """
        with suppress(SystemExit):
            parser.parse_args(["--version"])
        captured = capsys.readouterr()
        assert captured.out == VERSION
