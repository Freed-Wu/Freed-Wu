"""Config
=========

Configure ``visidata``.
"""
from visidata.main import options
from visidata.shell import DirSheet

DirSheet.addCommand(  # type: ignore
    "gu",
    "open-parent-dir",
    'vd.push(openSource(source/".."))',
    "open parent directory",
)
options.cmdlog_histfile = "~/.cache/visidata/visidata.tsv"  # type: ignore
options.color_default = "white"  # type: ignore
