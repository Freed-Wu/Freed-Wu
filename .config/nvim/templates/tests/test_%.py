r"""Test {{ join(split(expand('%:t:r'), '_')[1:], ' ') }}."""
from {{ substitute(expand('%:p:h:h:t'), '-', '_', 'g') }}.{{ join(split(expand('%:t:r'), '_')[1:], '_') }} import {% here %}


class Test:
    r"""Test."""

    @staticmethod
    def test_() -> None:
