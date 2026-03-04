r"""Test {{ split(expand('%:t:r'), '_')[1] }}."""
from {{ substitute(expand('%:p:h:h:t'), '-', '_', 'g') }}.{{ split(expand('%:t:r'), '_')[1] }} import {% here %}


class Test:
    r"""Test."""

    @staticmethod
    def test_() -> None:
