"""Config
=========

Configure ``ptpython``.
"""

import sys
from contextlib import suppress

from prompt_toolkit.key_binding.key_processor import KeyPressEvent
from prompt_toolkit.keys import Keys
from prompt_toolkit.styles import Style
from ptpython.completer import CompletePrivateAttributes
from ptpython.layout import CompletionVisualisation
from ptpython.repl import PythonRepl
from ptpython.style import default_ui_style

# https://github.com/prompt-toolkit/ptpython/pull/593
sys.ps1 = ">>> "


def configure(repl: PythonRepl) -> None:
    """Configure method. This is called during the start-up of ptpython.

    :param repl:
    :type repl: PythonRepl
    :rtype: None
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

    with suppress(ImportError):
        from pyrime.ptpython.rime import Rime
        from pyrime.ptpython.utils.prompt_style import PythonPrompt

        repl.all_prompt_styles["python"] = PythonPrompt(repl)
        # Use the classic prompt. (Display '>>>' instead of 'In [1]'.)
        repl.prompt_style = "python"  # 'classic' or 'ipython'

        rime = Rime(repl)

        @repl.add_key_binding(Keys.ControlCircumflex, filter=rime.insert_mode)
        def _(event: KeyPressEvent) -> None:
            rime.is_enabled = not rime.is_enabled

    with suppress(ImportError):
        from repl_python_wakatime.backends.chainedhook import ChainedHook
        from repl_python_wakatime.backends.codestats import CodeStats
        from repl_python_wakatime.backends.wakatime import Wakatime
        from repl_python_wakatime.frontends.ptpython import Ptpython

        repl.all_prompt_styles[repl.prompt_style] = Ptpython(
            ChainedHook(hooks=(CodeStats(), Wakatime())),
            repl.all_prompt_styles[repl.prompt_style],
        )
