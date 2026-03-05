r"""`<https://github.com/saulpw/visidata/issues/1762>`_"""

from typing import Any

from visidata import vd
from visidata.sheets import TableSheet


# https://github.com/saulpw/visidata/issues/1762
@TableSheet.before
def orderBy(sheet, *args: Any, **kwargs: Any) -> None:
    r"""Orderby.

    :param sheet:
    :param args:
    :type args: Any
    :param kwargs:
    :type kwargs: Any
    :rtype: None
    """
    if not hasattr(sheet, "origSortedRows"):
        sheet.origSortedRows = list(sheet.rows)


@TableSheet.api
def sort_disable(sheet) -> None:
    r"""Sort disable.

    :param sheet:
    :rtype: None
    """
    sheet.orderBy()
    sheet.rows = sheet.origSortedRows


TableSheet.addCommand(  # type: ignore
    "",
    "sort-disable",
    "sort_disable()",
    "disable sorting and revert back to original sort",
)
vd.addMenuItem("Column", "Sort by", "original ordering", "sort-disable")
