"""
Configuration example for ``ptpython``.

Copy this file to $XDG_CONFIG_HOME/ptpython/config.py
On Linux, this is: ~/.config/ptpython/config.py
"""
import sys
import re
from prompt_toolkit.filters import (
    emacs_mode, in_paste_mode, Condition,
    ViInsertMode, EmacsInsertMode, ViNavigationMode)
from prompt_toolkit.application.current import get_app
from prompt_toolkit.enums import EditingMode
from prompt_toolkit.key_binding.vi_state import InputMode, ViState
from prompt_toolkit.clipboard import ClipboardData
from prompt_toolkit.selection import SelectionType
from prompt_toolkit.keys import Keys
# from prompt_toolkit.key_binding.key_processor import KeyPress
# from prompt_toolkit.styles import Style

from typing import TYPE_CHECKING
if TYPE_CHECKING:
    from prompt_toolkit.key_binding.key_processor import KeyPressEvent

from ptpython.layout import CompletionVisualisation
from ptpython.completer import CompletePrivateAttributes

__all__ = ["configure"]


def get_input_mode(self):
    if sys.version_info[0] == 3:
        from prompt_toolkit.application.current import get_app

        app = get_app()
        # Decrease input flush timeout from 500ms to 10ms.
        app.ttimeoutlen = 0.01
        # Decrease handler call timeout from 1s to 250ms.
        app.timeoutlen = 0.25

    return self._input_mode


def set_input_mode(self, mode):
    shape = {InputMode.NAVIGATION: 2, InputMode.REPLACE: 4}.get(mode, 6)
    cursor = "\x1b[{} q".format(shape)

    if hasattr(sys.stdout, "_cli"):
        write = sys.stdout._cli.output.write_raw  # type: ignore
    else:
        write = sys.stdout.write

    write(cursor)
    sys.stdout.flush()

    self._input_mode = mode


ViState._input_mode = InputMode.INSERT  # type: ignore
ViState.input_mode = property(get_input_mode, set_input_mode)  # type: ignore


def configure(repl) -> None:
    """
    Configure method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
    """
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

    # Highlight matching parethesis.
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

    # Paste mode. (When True, don't insert whitespace after new line.)
    repl.paste_mode = False

    # Use the classic prompt. (Display '>>>' instead of 'In [1]'.)
    repl.prompt_style = 'ipython'  # 'classic' or 'ipython'

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
    repl.use_code_colorscheme('monokai')
    # repl.use_code_colorscheme("pastie")

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
    """
    repl.install_ui_colorscheme("my-colorscheme",
                                Style.from_dict(_custom_ui_colorscheme))
    repl.use_ui_colorscheme("my-colorscheme")
    """

    @repl.add_key_binding("escape", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.VI
        event.app.vi_state.input_mode = InputMode.NAVIGATION

    @repl.add_key_binding("i", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.EMACS
        event.app.vi_state.input_mode = InputMode.INSERT

    @repl.add_key_binding("a", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.EMACS
        event.app.vi_state.input_mode = InputMode.INSERT
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_cursor_right_position()
        )

    @repl.add_key_binding("I", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.EMACS
        event.app.vi_state.input_mode = InputMode.INSERT
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_start_of_line_position(
                after_whitespace=True
            )
        )

    @repl.add_key_binding("A", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.EMACS
        event.app.vi_state.input_mode = InputMode.INSERT
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_end_of_line_position()
        )

    @repl.add_key_binding("o", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.EMACS
        event.app.vi_state.input_mode = InputMode.INSERT
        event.current_buffer.insert_line_below(copy_margin=not in_paste_mode())

    @repl.add_key_binding("O", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.EMACS
        event.app.vi_state.input_mode = InputMode.INSERT
        event.current_buffer.insert_line_above(copy_margin=not in_paste_mode())

    @repl.add_key_binding("s", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.EMACS
        event.app.vi_state.input_mode = InputMode.INSERT
        text = event.current_buffer.delete(count=event.arg)
        event.app.clipboard.set_text(text)

    @repl.add_key_binding("C", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.EMACS
        event.app.vi_state.input_mode = InputMode.INSERT
        buffer = event.current_buffer

        deleted = buffer.delete(
            count=buffer.document.get_end_of_line_position())
        event.app.clipboard.set_text(deleted)

    @repl.add_key_binding("c", "c", filter=ViNavigationMode())
    @repl.add_key_binding("S", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        event.app.editing_mode = EditingMode.EMACS
        event.app.vi_state.input_mode = InputMode.INSERT
        buffer = event.current_buffer
        # We copy the whole line.
        data = ClipboardData(buffer.document.current_line, SelectionType.LINES)
        event.app.clipboard.set_data(data)

        # But we delete after the whitespace
        buffer.cursor_position += buffer.document.get_start_of_line_position(
            after_whitespace=True
        )
        buffer.delete(count=buffer.document.get_end_of_line_position())

    @repl.add_key_binding("c-x", "c-e", filter=EmacsInsertMode())
    @repl.add_key_binding("c-x", "c-e", filter=ViInsertMode())
    @repl.add_key_binding("g", "h", filter=ViNavigationMode())
    def _(event: "KeyPressEvent") -> None:
        buffer = event.current_buffer
        buffer.open_in_editor()

    @repl.add_key_binding("c-\\", filter=EmacsInsertMode())
    @repl.add_key_binding("c-\\", filter=ViInsertMode())
    def _(event: "KeyPressEvent") -> None:
        buffer = event.current_buffer
        buffer.cancel_completion()

    @repl.add_key_binding("c-j", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        buffer = event.current_buffer
        buffer.newline()

    @repl.add_key_binding("c-x", "c-j", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        buffer = event.current_buffer
        buffer.join_next_line()

    @repl.add_key_binding("K", filter=ViNavigationMode())
    @repl.add_key_binding("c-x", "c-_", filter=ViInsertMode())
    @repl.add_key_binding("c-x", "c-_", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_start_of_line_position(
                after_whitespace=True
            )
        )
        event.cli.current_buffer.insert_text("help(")
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_end_of_line_position()
        )
        event.cli.current_buffer.insert_text(")")
        event.current_buffer.validate_and_handle()

    # Add custom key binding for PDB.
    @repl.add_key_binding("c-x", "c-b", filter=ViInsertMode())
    @repl.add_key_binding("c-x", "c-b", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.cli.current_buffer.insert_text("\nimport pdb; pdb.set_trace()\n")

    @Condition
    def suggestion_available() -> bool:
        app = get_app()
        return (
            app.current_buffer.suggestion is not None
            and len(app.current_buffer.suggestion.text) > 0
            and app.current_buffer.document.is_cursor_at_the_end
        )

    @repl.add_key_binding("right",
                          filter=suggestion_available & ViInsertMode())
    @repl.add_key_binding("c-f", filter=suggestion_available & ViInsertMode())
    @repl.add_key_binding("right", filter=suggestion_available & emacs_mode)
    @repl.add_key_binding("c-f", filter=suggestion_available & emacs_mode)
    def _(event: "KeyPressEvent") -> None:
        b = event.current_buffer
        suggestion = b.suggestion

        if suggestion and event.arg > 0:
            b.insert_text(suggestion.text[
                0:min(event.arg, len(suggestion.text))])

    @repl.add_key_binding("c-]", Keys.Any,
                          filter=suggestion_available & emacs_mode)
    def _(event: "KeyPressEvent") -> None:
        b = event.current_buffer
        suggestion = b.suggestion

        # don't support event.arg
        if suggestion and event.arg > 0:
            t = re.split(event.data, suggestion.text)
            b.insert_text(next(x for x in t if x))
            if len(t) != 1:
                b.insert_text(event.data)

    # Typing Control E twice should also execute the current command.
    # (Alternative for Meta-Enter.)
    """
    @repl.add_key_binding("c-e", "c-e")
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.validate_and_handle()
    """

    # Typing 'jj' in Vi Insert mode, should send escape. (Go back to navigation
    # mode.)
    """
    @repl.add_key_binding("j", "j", filter=ViInsertMode())
    def _(event: "KeyPressEvent") -> None:
        " Map 'jj' to Escape. "
        event.cli.key_processor.feed(KeyPress(Keys("escape")))
    """

    # Custom key binding for some simple autocorrection while typing.
    # conflict with vi block insert mode
    """
    corrections = {
    }

    @repl.add_key_binding(" ")
    def _(event: "KeyPressEvent") -> None:
        " When a space is pressed. Check & correct word before cursor. "
        b = event.cli.current_buffer
        w = b.document.get_word_before_cursor()

        if w is not None:
            if w in corrections:
                b.delete_before_cursor(count=len(w))
                b.insert_text(corrections[w])

        b.insert_text(" ")
    """

    # Add a custom title to the status bar. This is useful when ptpython is
    # embedded in other applications.
    """
    repl.title = "My custom prompt."
    """


# Custom colorscheme for the UI. See `ptpython/layout.py` and
# `ptpython/style.py` for all possible tokens.
    """
    _custom_ui_colorscheme = {
        # Blue prompt.
        "prompt": "bg:#eeeeff #000000 bold",
        # Make the status toolbar red.
        "status-toolbar": "bg:#ff0000 #000000",
    }
    """
