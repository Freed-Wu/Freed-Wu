"""Config
=========

Configure ``visidata``.
"""
import os
import sys

from visidata import IndexSheet, vd
from visidata.canvas import Canvas
from visidata.canvas_text import TextCanvas
from visidata.main import options
from visidata.settings import _get_config_file
from visidata.shell import BaseSheet, Sheet

sys.path.insert(0, os.path.dirname(_get_config_file()))
from _visidata import sort  # type: ignore

sys.path.pop(0)

options.cmdlog_histfile = "~/.cache/visidata/visidata.tsv"  # type: ignore
options.color_default = "white"  # type: ignore
options.clipboard_copy_cmd = "xsel -ib"  # type: ignore
options.clipboard_paste_cmd = "xsel -ob"  # type: ignore
options.incr_base = 0  # type: ignore
options.visidata_dir = "~/.config/visidata"  # type: ignore
options.disp_status_fmt = "{sheet.shortcut} {sheet.name}{sheet.modifiedStatus} "  # type: ignore
# https://github.com/saulpw/visidata/issues/1803
# options.disp_rstatus_fmt = " {sheet.longname}  {sheet.nSelectedRows}{sheet.cursorRowIndex}/{sheet.nRows}{sheet.cursorColIndex}/{sheet.nCols}"  # type: ignore
options.disp_rstatus_fmt = " {sheet.longname}  {sheet.nSelectedRows}{sheet.cursorRowIndex}/{sheet.nRows}{sheet.nCols}"  # type: ignore
options.disp_menu_fmt = ""  # type: ignore
options.disp_more_left = "←"  # type: ignore
options.disp_more_right = "→"  # type: ignore

vd.allPrefixes += ["^W"]  # type: ignore
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
Sheet.addCommand(  # type: ignore
    "u",
    "undo-last",
    "vd.undo(sheet)",
    "Undo the most recent change (options.undo must be enabled)",
)
Sheet.addCommand(  # type: ignore
    "U",
    "unselect-row",
    "unselect_row(cursorRow); cursorDown(1)",
    "unselect current row",
)
Canvas.addCommand(  # type: ignore
    "U",
    "unselect-cursor",
    "source.unselect(list(rowsWithin(plotterCursorBox)))",
    "unselect rows on source sheet contained within canvas cursor",
)
TextCanvas.addCommand(  # type: ignore
    "U", "unselect-cursor", "source.unselect(cursorRows)"
)
BaseSheet.addCommand(  # type: ignore
    "^R",
    "redo-last",
    "vd.redo(sheet)",
    "Redo the most recent undo (options.undo must be enabled)",
)
BaseSheet.addCommand(  # type: ignore
    "R",
    "reload-sheet",
    'preloadHook(); reload(); recalc(); status("reloaded")',
    "Reload current sheet",
),
IndexSheet.addCommand(  # type: ignore
    "gR",
    "reload-selected",
    "reloadSheets(selectedRows or rows)",
    "reload all selected sheets",
)
Sheet.addCommand(  # type: ignore
    "x",
    "delete-row",
    "delete_row(cursorRowIndex); defer and cursorDown(1)",
    "delete current row",
)
Sheet.addCommand(  # type: ignore
    "gx", "delete-selected", "deleteSelected()", "delete selected rows"
)
Sheet.addCommand(  # type: ignore
    "zx",
    "delete-cell",
    "cursorCol.setValues([cursorRow], options.null_value)",
    "delete current cell (set to None)",
)
Sheet.addCommand(  # type: ignore
    "gzx",
    "delete-cells",
    "cursorCol.setValues(onlySelectedRows, options.null_value)",
    "delete contents of current column for selected rows (set to None)",
)
Sheet.addCommand(  # type: ignore
    "d",
    "cut-row",
    "copyRows([sheet.delete_row(cursorRowIndex)]); defer and cursorDown(1)",
    "delete (cut) current row and move it to clipboard",
)
Sheet.addCommand(  # type: ignore
    "gd",
    "cut-selected",
    "copyRows(onlySelectedRows); deleteSelected()",
    "delete (cut) selected rows and move them to clipboard",
)
Sheet.addCommand(  # type: ignore
    "zd",
    "cut-cell",
    "copyCells(cursorCol, [cursorRow]); cursorCol.setValues([cursorRow], None)",
    "delete (cut) current cell and move it to clipboard",
)
Sheet.addCommand(  # type: ignore
    "gzd",
    "cut-cells",
    "copyCells(cursorCol, onlySelectedRows); cursorCol.setValues(onlySelectedRows, None)",
    "delete (cut) contents of current column for selected rows and move them to clipboard",
)
Sheet.addCommand(  # type: ignore
    "^O",
    "sysedit-selected",
    "syseditCells(visibleCols, onlySelectedRows)",
    "edit rows in $EDITOR",
)
BaseSheet.addCommand(  # type: ignore
    "^Wn",
    "splitwin-half",
    "splitPane(vd.options.disp_splitwin_pct or 50)",
    "ensure split pane is set and push under sheet onto other pane",
)
BaseSheet.addCommand(  # type: ignore
    "^WN",
    "splitwin-input",
    'vd.options.disp_splitwin_pct = input("% height for split window: ", value=vd.options.disp_splitwin_pct)',
    "set split pane to specific size",
)
BaseSheet.addCommand(  # type: ignore
    "^Wo",
    "splitwin-close",
    "vd.options.disp_splitwin_pct = 0\nfor vs in vd.activeStack: vs.pane = 1",
    "close split screen",
)
BaseSheet.addCommand(  # type: ignore
    "^Ww",
    "splitwin-swap",
    "vd.activePane = 1 if sheet.pane == 2 else 2",
    "jump to inactive pane",
)
BaseSheet.addCommand(  # type: ignore
    "^Wr",
    "splitwin-swap-pane",
    "vd.options.disp_splitwin_pct=-vd.options.disp_splitwin_pct",
    "swap panes onscreen",
)
TableSheet.addCommand(  # type: ignore
    "gf",
    "open-cell-file",
    'vd.push(openSource(cursorDisplay) or fail(f"file {cursorDisplay} does not exist"))',
    "Open file or URL from path in current cell",
)
BaseSheet.addCommand(  # type: ignore
    "^We",
    "open-new",
    'vd.push(vd.newSheet("unnamed", 1))',
    "Open new empty sheet",
)
