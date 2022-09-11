from contextlib import suppress
import os
from os.path import dirname as dirn
import sys
from pathlib import Path

from setuptools import find_packages

rootpath = dirn(dirn(os.path.abspath(__file__)))
path = os.path.join(rootpath, "src")
packages = find_packages(path)
if packages == []:
    path = rootpath
    packages = find_packages(path)
sys.path.insert(0, path)
# pyright:reportMissingImports=false
from foo import __version__ as VERSION  # noqa: E402

with suppress(FileNotFoundError):
    readme = next(iter(Path("..").glob("README*")))
    Path(readme.name).write_text(
        readme.read_text().replace("images/", "../images/")
    )
