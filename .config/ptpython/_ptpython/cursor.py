"""Cursor
=========

Refer `<https://github.com/prompt-toolkit/python-prompt-toolkit/issues/192>`_
"""
import sys

from prompt_toolkit.key_binding.vi_state import InputMode, ViState


def get_input_mode(self) -> InputMode:
    """Get input mode.

    :param self:
    :rtype: InputMode
    """
    return self._input_mode


def set_input_mode(self, mode: InputMode) -> None:
    """Set input mode.

    :param self:
    :param mode:
    :type mode: InputMode
    :rtype: None
    """
    shape = {InputMode.NAVIGATION: 2, InputMode.REPLACE: 4}.get(mode, 6)
    cursor = f"\x1b[{shape} q"
    sys.stdout.write(cursor)
    sys.stdout.flush()
    self._input_mode = mode


ViState._input_mode = InputMode.INSERT  # type: ignore
ViState.input_mode = property(get_input_mode, set_input_mode)  # type: ignore
