from contextlib import suppress
from pathlib import Path
from typing import Final
from importlib import import_module

from . import packages

PACKAGE: Final = packages[0]
VERSION: Final = import_module(PACKAGE).__version__

with suppress(FileNotFoundError):
    readme = next(iter(Path("..").glob("README*")))
    Path(readme.name).write_text(
        readme.read_text().replace("images/", "../images/")
    )
