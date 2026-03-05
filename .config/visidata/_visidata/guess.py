r"""`<https://github.com/saulpw/visidata/issues/349>`_"""

import dateutil
import visidata
from visidata._types import anytype
from visidata.basesheet import BaseSheet
from visidata.column import Column
from visidata.graph import GraphSheet
from visidata.shell import DirSheet
from visidata.type_date import date

N_ROWS_FOR_TYPE_GUESSING = 10
DEFAULT_FLOAT_PRECISION = 2


@GraphSheet.api
def guess_y_axis(graph_sheet: GraphSheet) -> None:
    values = tuple(
        column.getTypedValue(row)
        for column in graph_sheet.ycols
        for row in column.sheet.rows
    )
    min_value = min(values)
    max_value = max(values)
    if 0 <= min_value <= max_value <= 1:
        graph_sheet.set_y("-0.1 1.1")
        graph_sheet.extra_y_ticks = (0, 1)
    elif -1 <= min_value <= max_value <= 1:
        graph_sheet.set_y("-1.1 1.1")
        graph_sheet.extra_y_ticks = (-1, 1)


def guess_column_types(sheet: BaseSheet) -> None:
    if isinstance(sheet, DirSheet):
        # These break for some reason.
        return

    for column in sheet.visibleCols:
        if column.type not in (anytype, int):
            continue

        type_candidates = [date, int, float, anytype]
        if "datetime" not in column.name:
            type_candidates.remove(date)
        try:
            values = tuple(
                column.getValue(r)
                for r in sheet.rows[:N_ROWS_FOR_TYPE_GUESSING]
            )
        except Exception:
            # I got an inexplicable `NameError` here while doing this on a
            # `DirSheet`, so let's not guess a column when that happens.
            continue

        for value in values:
            if value == "" or value is None:
                continue
            if date in type_candidates:
                try:
                    date(value)
                except dateutil.parser.ParserError:
                    type_candidates.remove(date)

            if int in type_candidates:
                try:
                    value_as_int = int(value)
                except (ValueError, TypeError):
                    type_candidates.remove(int)
                else:
                    if float(value) != value_as_int:
                        type_candidates.remove(int)

            if float in type_candidates:
                try:
                    float(value)
                except (ValueError, TypeError):
                    type_candidates.remove(float)

        column.type = type_candidates[0]

        if column.type is float:
            numbers = tuple(
                column.getTypedValue(r)
                for r in sheet.rows[:N_ROWS_FOR_TYPE_GUESSING]
                if column.getTypedValue(r) and column.getTypedValue(r) != ""
            )
            biggest_number = max(map(abs, numbers))
            if biggest_number > 0:
                for i in range(2, 6):
                    if 10 ** (-(i - 1)) < biggest_number:
                        if i != DEFAULT_FLOAT_PRECISION:
                            column.fmtstr = f"%.{i}f"
                        break


def guess_key_columns(sheet: BaseSheet) -> None:
    if sheet.columns and sheet.columns[0].name in (
        "generation",
        "i_agent",
        "time_step",
    ):
        sheet.setKeys([sheet.columns[0]])


@BaseSheet.api
def autotune(sheet: BaseSheet) -> None:
    if isinstance(sheet, GraphSheet):
        guess_y_axis(sheet)
        # Put selection box outside the plot:
        sheet.cursorBox.xmin = sheet.visibleBox.xmin - 8 * sheet.cursorBox.w
    else:
        visidata.features.expand_cols.expand_cols_deep(
            sheet, sheet.visibleCols, depth=0
        )
        guess_column_types(sheet)
        guess_key_columns(sheet)
        for column in sheet.visibleCols:
            column: Column
            if column.type is anytype:
                try:
                    first_value = column.getValue(sheet.rows[0])
                except Exception:
                    # I got an inexplicable `NameError` here while doing this
                    # on a `DirSheet`, so let's not guess a column when that
                    # happens.
                    continue
                if isinstance(first_value, dict):
                    column.setWidth(len(column.name) + 5)
                    continue
            column.setWidth(column.getMaxWidth(sheet.visibleRows))


BaseSheet.addCommand("gr", "autotune", "autotune()")
