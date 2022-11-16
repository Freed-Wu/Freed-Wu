"""Config Visidata."""

DirSheet.addCommand(
    "gu",
    "open-parent-dir",
    'vd.push(openSource(source/".."))',
    "open parent directory",
)
options.cmdlog_histfile = "~/.cache/visidata/visidata.tsv"
