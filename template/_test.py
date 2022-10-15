"""%FILE%."""
from contextlib import suppress

from %TEST_FILE%.__main__ import get_parser, VERSION
parser = get_parser("%TEST_FILE%")


class Test:
    """Test."""

    def test_help(self, capsys):
        """test_help.

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

    def test_version(self, capsys):
        """test_version.

        :param capsys:
        """
        with suppress(SystemExit):
            parser.parse_args(["--version"])
        captured = capsys.readouterr()
        assert captured.out == VERSION
