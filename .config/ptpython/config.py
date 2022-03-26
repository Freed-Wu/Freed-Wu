"""
Configuration example for ``ptpython``.

Copy this file to $XDG_CONFIG_HOME/ptpython/config.py
On Linux, this is: ~/.config/ptpython/config.py
"""
import sys
import re
from typing import TYPE_CHECKING

from prompt_toolkit.filters import (
    emacs_mode,
    in_paste_mode,
    Condition,
    ViInsertMode,
    EmacsInsertMode,
    ViNavigationMode,
)
from prompt_toolkit.application.current import get_app
from prompt_toolkit.enums import EditingMode
from prompt_toolkit.key_binding.vi_state import InputMode, ViState
from prompt_toolkit.key_binding.bindings.named_commands import (
    unix_word_rubout,
    delete_char,
    backward_delete_char,
    backward_char,
    forward_char,
)
from prompt_toolkit.clipboard import ClipboardData
from prompt_toolkit.selection import SelectionType
from prompt_toolkit.keys import Keys

# from prompt_toolkit.key_binding.key_processor import KeyPress
from ptpython.layout import CompletionVisualisation
from ptpython.completer import CompletePrivateAttributes

if TYPE_CHECKING:
    from prompt_toolkit.key_binding.key_processor import KeyPressEvent

__all__ = ["configure"]


# cursor {{{1 #
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
# 1}}} cursor #


def configure(repl) -> None:
    """
    Configure method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
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
    repl.prompt_style = "ipython"  # 'classic' or 'ipython'

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
    """
    repl.install_ui_colorscheme("my-colorscheme",
                                Style.from_dict(_custom_ui_colorscheme))
    repl.use_ui_colorscheme("my-colorscheme")
    """
    # 1}}} repl #

    # vi {{{1 #
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
            count=buffer.document.get_end_of_line_position()
        )
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

    # 1}}} vi #

    # emacs {{{1 #
    @repl.add_key_binding("escape", "m", filter=ViInsertMode())
    @repl.add_key_binding("escape", "m", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        c: int = 0
        while b.document.char_before_cursor == " ":
            backward_char(event)
            c += 1
        w: str = b.document.get_word_before_cursor()
        for _ in range(c):
            forward_char(event)
        event.cli.current_buffer.insert_text(w)

    @repl.add_key_binding("escape", "w", filter=ViInsertMode())
    @repl.add_key_binding("escape", "w", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        unix_word_rubout(event)

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

    # 1}}} emacs #

    # term {{{1 #
    @repl.add_key_binding("escape", *"[13;2u", filter=ViNavigationMode())
    @repl.add_key_binding("escape", *"[13;2u", filter=ViInsertMode())
    @repl.add_key_binding("escape", *"[13;2u", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.validate_and_handle()

    @repl.add_key_binding("escape", *"[13;5u", filter=ViNavigationMode())
    @repl.add_key_binding("escape", *"[13;5u", filter=ViInsertMode())
    @repl.add_key_binding("escape", *"[13;5u", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.validate_and_handle()

    # 1}}} term #

    # autopair {{{1 #
    @repl.add_key_binding("c-h", filter=ViInsertMode())
    @repl.add_key_binding("c-h", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        cr: str = b.document.current_char
        if b.document.cursor_position_col == 0:
            cl: str = ""
        else:
            cl: str = b.document.char_before_cursor
        if b.document.cursor_position_col <= 1:
            cl2: str = ""
        else:
            backward_char(event)
            cl2: str = b.document.char_before_cursor
            forward_char(event)
        for c0, c1 in ["[]", "()", "{}", "''", "``", '""']:
            if cl == c0 and cr == c1:
                delete_char(event)
                break
            elif cl == c1 and cl2 == c0:
                backward_delete_char(event)
                break
        backward_delete_char(event)

    @repl.add_key_binding("[", filter=ViInsertMode())
    @repl.add_key_binding("[", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.cli.current_buffer.insert_text("[]")
        backward_char(event)

    @repl.add_key_binding("]", filter=ViInsertMode())
    @repl.add_key_binding("]", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.current_char != "]":
            b.insert_text("]")
        else:
            forward_char(event)

    @repl.add_key_binding("(", filter=ViInsertMode())
    @repl.add_key_binding("(", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.cli.current_buffer.insert_text("()")
        backward_char(event)

    @repl.add_key_binding(")", filter=ViInsertMode())
    @repl.add_key_binding(")", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.current_char != ")":
            b.insert_text(")")
        else:
            forward_char(event)

    @repl.add_key_binding("{", filter=ViInsertMode())
    @repl.add_key_binding("{", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.cli.current_buffer.insert_text("{}")
        backward_char(event)

    @repl.add_key_binding("}", filter=ViInsertMode())
    @repl.add_key_binding("}", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.current_char != "}":
            b.insert_text("}")
        else:
            forward_char(event)

    @repl.add_key_binding("'", filter=ViInsertMode())
    @repl.add_key_binding("'", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.current_char != "'":
            b.insert_text("''")
            backward_char(event)
        else:
            forward_char(event)

    @repl.add_key_binding("`", filter=ViInsertMode())
    @repl.add_key_binding("`", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.current_char != "`":
            b.insert_text("``")
            backward_char(event)
        else:
            forward_char(event)

    @repl.add_key_binding('"', filter=ViInsertMode())
    @repl.add_key_binding('"', filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.current_char != '"':
            b.insert_text('""')
            backward_char(event)
        else:
            forward_char(event)

    # 1}}} autopair #

    # smartinput {{{1 #
    # One {{{2 #
    @repl.add_key_binding(",", filter=ViInsertMode())
    @repl.add_key_binding(",", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.current_char == " ":
            b.insert_text(",")
        else:
            b.insert_text(", ")

    # 2}}} One #

    # Two {{{2 #
    # Operation {{{3 #
    @repl.add_key_binding("+", filter=ViInsertMode())
    @repl.add_key_binding("+", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.current_char == " ":
            b.insert_text("+")
        else:
            b.insert_text(" + ")

    @repl.add_key_binding("@", filter=ViInsertMode())
    @repl.add_key_binding("@", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if (
            b.document.char_before_cursor == " "
            or b.document.cursor_position_col == 0
        ):
            b.insert_text("@")
        else:
            b.insert_text(" @ ")

    @repl.add_key_binding("*", filter=ViInsertMode())
    @repl.add_key_binding("*", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("*")
        else:
            b.insert_text(" * ")

    @repl.add_key_binding("*", "*", filter=ViInsertMode())
    @repl.add_key_binding("*", "*", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("**")
        else:
            b.insert_text(" ** ")

    @repl.add_key_binding("/", "/", filter=ViInsertMode())
    @repl.add_key_binding("/", "/", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("//")
        else:
            b.insert_text(" // ")

    @repl.add_key_binding("%", filter=ViInsertMode())
    @repl.add_key_binding("%", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if (
            b.document.char_before_cursor == " "
            or b.document.cursor_position_col == 0
        ):
            b.insert_text("%")
        else:
            b.insert_text(" % ")

    @repl.add_key_binding("&", filter=ViInsertMode())
    @repl.add_key_binding("&", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("&")
        else:
            b.insert_text(" & ")

    @repl.add_key_binding("|", filter=ViInsertMode())
    @repl.add_key_binding("|", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("|")
        else:
            b.insert_text(" | ")

    @repl.add_key_binding("^", filter=ViInsertMode())
    @repl.add_key_binding("^", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("^")
        else:
            b.insert_text(" ^ ")

    # 3}}} Operation #

    # Relation {{{3 #
    @repl.add_key_binding("<", filter=ViInsertMode())
    @repl.add_key_binding("<", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("<")
        else:
            b.insert_text(" < ")

    @repl.add_key_binding(">", filter=ViInsertMode())
    @repl.add_key_binding(">", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text(">")
        else:
            b.insert_text(" > ")

    @repl.add_key_binding("=", "=", filter=ViInsertMode())
    @repl.add_key_binding("=", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("==")
        else:
            b.insert_text(" == ")

    @repl.add_key_binding("!", "=", filter=ViInsertMode())
    @repl.add_key_binding("!", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("!=")
        else:
            b.insert_text(" != ")

    @repl.add_key_binding("<", "=", filter=ViInsertMode())
    @repl.add_key_binding("<", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("<=")
        else:
            b.insert_text(" <= ")

    @repl.add_key_binding(">", "=", filter=ViInsertMode())
    @repl.add_key_binding(">", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text(">=")
        else:
            b.insert_text(" >= ")

    # 3}}} Relation #

    # Assign {{{3 #
    @repl.add_key_binding("=", filter=ViInsertMode())
    @repl.add_key_binding("=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("=")
        else:
            b.insert_text(" = ")

    @repl.add_key_binding("+", "=", filter=ViInsertMode())
    @repl.add_key_binding("+", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("+=")
        else:
            b.insert_text(" += ")

    @repl.add_key_binding("-", "=", filter=ViInsertMode())
    @repl.add_key_binding("-", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("-=")
        else:
            b.insert_text(" -= ")

    @repl.add_key_binding("@", "=", filter=ViInsertMode())
    @repl.add_key_binding("@", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("@=")
        else:
            b.insert_text(" @= ")

    @repl.add_key_binding("*", "=", filter=ViInsertMode())
    @repl.add_key_binding("*", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("*=")
        else:
            b.insert_text(" *= ")

    @repl.add_key_binding("/", "=", filter=ViInsertMode())
    @repl.add_key_binding("/", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("/=")
        else:
            b.insert_text(" /= ")

    @repl.add_key_binding("*", "*", "=", filter=ViInsertMode())
    @repl.add_key_binding("*", "*", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("**=")
        else:
            b.insert_text(" **= ")

    @repl.add_key_binding("/", "/", "=", filter=ViInsertMode())
    @repl.add_key_binding("/", "/", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("//=")
        else:
            b.insert_text(" //= ")

    @repl.add_key_binding("%", "=", filter=ViInsertMode())
    @repl.add_key_binding("%", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("%=")
        else:
            b.insert_text(" %= ")

    @repl.add_key_binding("&", "=", filter=ViInsertMode())
    @repl.add_key_binding("&", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("&=")
        else:
            b.insert_text(" &= ")

    @repl.add_key_binding("|", "=", filter=ViInsertMode())
    @repl.add_key_binding("|", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("|=")
        else:
            b.insert_text(" |= ")

    @repl.add_key_binding("^", "=", filter=ViInsertMode())
    @repl.add_key_binding("^", "=", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        b = event.cli.current_buffer
        if b.document.char_before_cursor == " ":
            b.insert_text("^=")
        else:
            b.insert_text(" ^= ")

    # 3}}} Assign #
    # 2}}} Two #
    # 1}}} smartinput #

    # python {{{1 #
    @repl.add_key_binding("K", filter=ViNavigationMode())
    @repl.add_key_binding("escape", "c-h", filter=ViInsertMode())
    @repl.add_key_binding("escape", "c-h", filter=EmacsInsertMode())
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

    @repl.add_key_binding("escape", "c-p", filter=ViInsertMode())
    @repl.add_key_binding("escape", "c-p", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_start_of_line_position(
                after_whitespace=True
            )
        )
        event.cli.current_buffer.insert_text("print(")
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_end_of_line_position()
        )
        event.cli.current_buffer.insert_text(")")
        event.current_buffer.validate_and_handle()

    @repl.add_key_binding("escape", "c-_", filter=ViInsertMode())
    @repl.add_key_binding("escape", "c-_", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_start_of_line_position(
                after_whitespace=True
            )
        )
        event.cli.current_buffer.insert_text("import numpy as np; "
                                             'np.lookfor("')
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_end_of_line_position()
        )
        event.cli.current_buffer.insert_text('")')
        backward_char(event)

    @repl.add_key_binding("escape", "c-o", filter=ViInsertMode())
    @repl.add_key_binding("escape", "c-o", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_start_of_line_position(
                after_whitespace=True
            )
        )
        event.cli.current_buffer.insert_text("import numpy as np; np.source(")
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_end_of_line_position()
        )
        event.cli.current_buffer.insert_text(")")
        event.current_buffer.validate_and_handle()

    @repl.add_key_binding("escape", "c-l", filter=ViInsertMode())
    @repl.add_key_binding("escape", "c-l", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_start_of_line_position(
                after_whitespace=True
            )
        )
        event.cli.current_buffer.insert_text("list(")
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_end_of_line_position()
        )
        event.cli.current_buffer.insert_text(")")
        event.current_buffer.validate_and_handle()

    @repl.add_key_binding("escape", "c-t", filter=ViInsertMode())
    @repl.add_key_binding("escape", "c-t", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_start_of_line_position(
                after_whitespace=True
            )
        )
        event.cli.current_buffer.insert_text("type(")
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_end_of_line_position()
        )
        event.cli.current_buffer.insert_text(")")
        event.current_buffer.validate_and_handle()

    @repl.add_key_binding("escape", "c-e", filter=ViInsertMode())
    @repl.add_key_binding("escape", "c-e", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_start_of_line_position(
                after_whitespace=True
            )
        )
        event.cli.current_buffer.insert_text("len(")
        event.current_buffer.cursor_position += (
            event.current_buffer.document.get_end_of_line_position()
        )
        event.cli.current_buffer.insert_text(")")
        event.current_buffer.validate_and_handle()

    # Add custom key binding for PDB.
    @repl.add_key_binding("escape", "c-b", filter=ViInsertMode())
    @repl.add_key_binding("escape", "c-b", filter=EmacsInsertMode())
    def _(event: "KeyPressEvent") -> None:
        event.cli.current_buffer.insert_text("\nbreakpoint()\n")

    # 1}}} python #

    # autosuggestions {{{1 #
    @Condition
    def suggestion_available() -> bool:
        app = get_app()
        return (
            app.current_buffer.suggestion is not None
            and len(app.current_buffer.suggestion.text) > 0
            and app.current_buffer.document.is_cursor_at_the_end
        )

    @repl.add_key_binding(
        "right", filter=suggestion_available & ViInsertMode()
    )
    @repl.add_key_binding("c-f", filter=suggestion_available & ViInsertMode())
    @repl.add_key_binding("right", filter=suggestion_available & emacs_mode)
    @repl.add_key_binding("c-f", filter=suggestion_available & emacs_mode)
    def _(event: "KeyPressEvent") -> None:
        b = event.current_buffer
        suggestion = b.suggestion

        if suggestion and event.arg > 0:
            b.insert_text(
                suggestion.text[0:min(event.arg, len(suggestion.text))]
            )

    @repl.add_key_binding(
        "c-]", Keys.Any, filter=suggestion_available & emacs_mode
    )
    def _(event: "KeyPressEvent") -> None:
        b = event.current_buffer
        suggestion = b.suggestion

        # don't support event.arg
        if suggestion and event.arg > 0:
            t = re.split(event.data, suggestion.text)
            b.insert_text(next(x for x in t if x))
            if len(t) != 1:
                b.insert_text(event.data)

    # 1}}} autosuggestions #

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


# ex: foldmethod=marker
