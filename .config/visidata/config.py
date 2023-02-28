"""Config
=========

Configure ``visidata``.
"""
from visidata.main import options
from visidata.shell import BaseSheet, DirSheet, Sheet

DirSheet.addCommand(  # type: ignore
    "gu",
    "open-parent-dir",
    'vd.push(openSource(source/".."))',
    "open parent directory",
)
Sheet.addCommand(  # type: ignore
    "g;",
    "split-col",
    'addRegexColumns(makeRegexSplitter, cursorCol, input("split regex: ", type="regex-split"))',
    "Add new columns from regex split",
)
Sheet.addCommand(  # type: ignore
    ":",
    "exec-longname",
    "exec_longname(inputLongname())",
    "execute command by its longname",
)
BaseSheet.addCommand(  # type: ignore
    " ",
    "menu-file",
    'pressMenu("File")',
    "",
)
BaseSheet.bindkey("^H", "sysopen-help")  # type: ignore
BaseSheet.bindkey("KEY_BACKSPACE", "sysopen-help")  # type: ignore
options.cmdlog_histfile = "~/.cache/visidata/visidata.tsv"  # type: ignore
options.color_default = "white"  # type: ignore
options.clipboard_copy_cmd = "xsel -ib"  # type: ignore
options.clipboard_paste_cmd = "xsel -ob"  # type: ignore
options.incr_base = 0  # type: ignore
options.visidata_dir = "~/.config/visidata"  # type: ignore
options.disp_status_fmt = "{sheet.shortcut} {sheet.name}{sheet.modifiedStatus} "  # type: ignore
options.disp_rstatus_fmt = " {sheet.longname}  {sheet.nRows} {sheet.nSelectedRows}"  # type: ignore
options.disp_menu_fmt = ""  # type: ignore
options.disp_more_left = "←"  # type: ignore
options.disp_more_right = "→"  # type: ignore
