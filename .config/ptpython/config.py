"""Config
=========

Configure ``ptpython``.
"""

import sys
from contextlib import suppress
from typing import Any

from prompt_toolkit.application import Application
from prompt_toolkit.cursor_shapes import CursorShape, ModalCursorShapeConfig
from prompt_toolkit.enums import EditingMode
from prompt_toolkit.filters import EmacsInsertMode, ViNavigationMode
from prompt_toolkit.key_binding.bindings.named_commands import (
    backward_char,
    forward_char,
    unix_word_rubout,
)
from prompt_toolkit.key_binding.key_processor import KeyPressEvent
from prompt_toolkit.key_binding.vi_state import InputMode
from prompt_toolkit.styles import Style
from ptpython.completer import CompletePrivateAttributes
from ptpython.layout import CompletionVisualisation
from ptpython.repl import PythonRepl
from ptpython.style import default_ui_style
from pyrime.ptpython.plugins import Rime
from pyrime.ptpython.plugins.autopair import autopair
from pyrime.ptpython.plugins.autosuggestion import autosuggestion
from pyrime.ptpython.plugins.smartinput import smartinput
from pyrime.ptpython.plugins.viemacs import viemacs
from pyrime.ptpython.utils.condition import (
    InsertMode,
    any_condition,
)
from pyrime.ptpython.utils.insert import insert
from pyrime.ptpython.utils.prompt_style import PythonPrompt

# https://github.com/prompt-toolkit/ptpython/pull/593
sys.ps1 = ">>> "


# https://github.com/prompt-toolkit/python-prompt-toolkit/pull/1900
def get_cursor_shape(self, application: "Application[Any]") -> CursorShape:
    if application.editing_mode == EditingMode.VI:
        if application.vi_state.input_mode in {
            InputMode.INSERT,
            InputMode.INSERT_MULTIPLE,
        }:
            return CursorShape.BEAM
        if application.vi_state.input_mode in {
            InputMode.NAVIGATION,
        }:
            return CursorShape.BLOCK
        if application.vi_state.input_mode in {
            InputMode.REPLACE,
            InputMode.REPLACE_SINGLE,
        }:
            return CursorShape.UNDERLINE

    # Default
    return CursorShape.BEAM


ModalCursorShapeConfig.get_cursor_shape = get_cursor_shape


def configure(repl: PythonRepl) -> None:
    """Configure method. This is called during the start-up of ptpython.

    :param repl:
    :type repl: PythonRepl
    :rtype: None
    """
    # repl {{{1 #
    repl.accept_input_on_enter = 1
    repl.complete_private_attributes = CompletePrivateAttributes.IF_NO_PUBLIC
    repl.enable_output_formatting = True
    repl.app.timeoutlen = 0.5
    repl.app.ttimeoutlen = 0.05
    # Show function signature (bool).
    repl.show_signature = True

    # Show docstring (bool).
    repl.show_docstring = True

    # Show the "[Meta+Enter] Execute" message when pressing [Enter] only
    # inserts a newline instead of executing the code.
    repl.show_meta_enter_message = True

    # Show completions. (NONE, POP_UP, MULTI_COLUMN or TOOLBAR)
    repl.completion_visualisation = CompletionVisualisation.POP_UP

    # When CompletionVisualisation.POP_UP has been chosen, use this
    # scroll_offset in the completion menu.
    repl.completion_menu_scroll_offset = 0

    # Show line numbers (when the input contains multiple lines.)
    repl.show_line_numbers = True

    # Show status bar.
    repl.show_status_bar = False

    # When the sidebar is visible, also show the help text.
    repl.show_sidebar_help = True

    # Swap light/dark colors on or off
    repl.swap_light_and_dark = False

    # Highlight matching parenthesis.
    repl.highlight_matching_parenthesis = True

    # Line wrapping. (Instead of horizontal scrolling.)
    repl.wrap_lines = True

    # Mouse support.
    repl.enable_mouse_support = True

    # Complete while typing. (Don't require tab before the
    # completion menu is shown.)
    repl.complete_while_typing = True

    # Fuzzy and dictionary completion.
    repl.enable_fuzzy_completion = False
    repl.enable_dictionary_completion = True

    # Vi mode.
    repl.vi_mode = False
    repl.cursor_shape_config = "Modal (vi)"

    # Paste mode. (When True, don't insert whitespace after new line.)
    repl.paste_mode = False

    # Use the classic prompt. (Display '>>>' instead of 'In [1]'.)
    repl.prompt_style = "python"  # 'classic' or 'ipython'

    repl.all_prompt_styles |= {"python": PythonPrompt(repl)}

    with suppress(ImportError):
        from repl_python_wakatime.ptpython import install_hook

        install_hook(repl)
        with suppress(ImportError):
            from repl_python_wakatime.hooks.codestats import codestats_hook

            install_hook(repl, codestats_hook)

    # Don't insert a blank line after the output.
    repl.insert_blank_line_after_output = False

    # History Search.
    # When True, going back in history will filter the history on the records
    # starting with the current input. (Like readline.)
    # Note: When enable, please disable the `complete_while_typing` option.
    #       otherwise, when there is a completion available, the arrows will
    #       browse through the available completions instead of the history.
    repl.enable_history_search = False

    # Enable auto suggestions. (Pressing right arrow will complete the input,
    # based on the history.)
    repl.enable_auto_suggest = True

    # Enable open-in-editor. Pressing C-x C-e in emacs mode or 'v' in
    # Vi navigation mode will open the input in the current editor.
    repl.enable_open_in_editor = False

    # Enable system prompt. Pressing meta-! will display the system prompt.
    # Also enables Control-Z suspend.
    repl.enable_system_bindings = True

    # Ask for confirmation on exit.
    repl.confirm_exit = False

    # Enable input validation. (Don't try to execute when the input contains
    # syntax errors.)
    repl.enable_input_validation = True

    # Use this colorscheme for the code.
    repl.use_code_colorscheme("monokai")

    # Set color depth (keep in mind that not all terminals support true color).

    # repl.color_depth = "DEPTH_1_BIT"  # Monochrome.
    # repl.color_depth = "DEPTH_4_BIT"  # ANSI colors only.
    # repl.color_depth = "DEPTH_8_BIT"  # The default, 256 colors.
    # repl.color_depth = "DEPTH_24_BIT"  # True color.

    # Min/max brightness
    repl.min_brightness = 0.0  # Increase for dark terminal backgrounds.
    repl.max_brightness = 1.0  # Decrease for light terminal backgrounds.

    # Syntax.
    repl.enable_syntax_highlighting = True

    # Get into Vi navigation mode at startup
    repl.vi_start_in_navigation_mode = True

    # Preserve last used Vi input mode between main loop iterations
    repl.vi_keep_last_used_mode = True

    # Install custom colorscheme named 'my-colorscheme' and use it.
    _custom_ui_colorscheme = default_ui_style | {
        "in.number": "fg:ansiwhite",
        "out.number": "fg:ansiwhite",
    }
    repl.install_ui_colorscheme(
        "my-colorscheme", Style.from_dict(_custom_ui_colorscheme)
    )
    repl.use_ui_colorscheme("my-colorscheme")

    # https://github.com/Textualize/rich/pull/2759
    repl.show_result = sys.displayhook  # type: ignore
    # 1}}} repl #

    @repl.add_key_binding("c-j", filter=EmacsInsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        buffer = event.current_buffer
        buffer.newline()

    @repl.add_key_binding("c-x", "c-j", filter=EmacsInsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        buffer = event.current_buffer
        buffer.join_next_line()

    # Custom key binding for some simple autocorrection while typing.
    # conflict with vi block insert mode
    """
    corrections = {
    }

    @repl.add_key_binding(" ")
    def _(event: KeyPressEvent) -> None:
        " When a space is pressed. Check & correct word before cursor. "
        b = event.cli.current_buffer
        w = b.document.get_word_before_cursor()

        if w is not None:
            if w in corrections:
                b.delete_before_cursor(count=len(w))
                b.insert_text(corrections[w])

        b.insert_text(" ")
    """

    # gdb doesn't allow to load binary python module

    rime = Rime(repl)
    autopair(rime)
    autosuggestion(repl)
    smartinput(rime)
    viemacs(rime)

    @repl.add_key_binding(
        "c-^",
        filter=any_condition(InsertMode, rime.mode(["c-^"])),
    )
    def _(event: KeyPressEvent) -> None:
        rime.toggle()

    @repl.add_key_binding("escape", "m", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        b = event.cli.current_buffer
        c: int = 0
        while b.document.char_before_cursor == " ":
            backward_char(event)
            c += 1
        w: str = b.document.get_word_before_cursor()
        for _ in range(c):
            forward_char(event)
        event.cli.current_buffer.insert_text(w)

    @repl.add_key_binding("escape", "w", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        unix_word_rubout(event)

    @repl.add_key_binding("c-x", "c-e", filter=InsertMode())
    @repl.add_key_binding("g", "h", filter=ViNavigationMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        buffer = event.current_buffer
        buffer.open_in_editor()

    @repl.add_key_binding("c-\\", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        buffer = event.current_buffer
        buffer.cancel_completion()

    # python {{{1 #
    @repl.add_key_binding("K", filter=ViNavigationMode())
    @repl.add_key_binding("escape", "c-h", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        insert(event, "help(", ")")

    @repl.add_key_binding("escape", "c-p", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        insert(event, "print(", ")")

    @repl.add_key_binding("escape", "c-_", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        insert(event, 'import numpy as np; np.lookfor("', '")')

    @repl.add_key_binding("escape", "c-o", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        insert(event, 'import numpy as np; np.source("', '")')

    @repl.add_key_binding("escape", "c-l", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        insert(event, "list(", ")")

    @repl.add_key_binding("escape", "c-d", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        insert(event, "dict(", ")")

    @repl.add_key_binding("escape", "c-t", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        insert(event, "type(", ")")

    @repl.add_key_binding("escape", "c-n", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        insert(event, "next(iter(", "))")

    @repl.add_key_binding("escape", "c-e", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        insert(event, "len(", ")")

    # Add custom key binding for PDB.
    @repl.add_key_binding("escape", "c-b", filter=InsertMode())
    def _(event: KeyPressEvent) -> None:
        """.

        :param event:
        :type event: KeyPressEvent
        :rtype: None
        """
        event.cli.current_buffer.insert_text("\nbreakpoint()\n")

    # 1}}} python #


# ex: foldmethod=marker
