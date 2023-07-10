r"""Test __main__."""
from contextlib import suppress

from {{ substitute(expand('%:p:h:h:t'), '-', '_', 'g') }}.__main__ import get_parser, VERSION
parser = get_parser("{{ substitute(expand('%:p:h:h:t'), '-', '_', 'g') }}")


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
usage: {{ substitute(expand('%:t'), '_test.py [-h] [-q] [-d] [-v] [--print-completion {bash,zsh,tcsh}]
, '', 'g') }} [-h] [-q] [-d] [-v] [--print-completion {bash,zsh,tcsh}]

{{ substitute(expand('%:t'), '_test.py.
, '', 'g') }}.

options:
  -h, --help            show this help message and exit
  -q, --quiet           Don't show normal information.
  -d, --debug           Show debug information.
  -v, --version         show program's version number and exit
  --print-completion {bash,zsh,tcsh}
                        print shell completion script

Report bugs to <{{ g:snips_email }}>.
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
