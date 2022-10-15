"""``{docs,tests}/__init__.py``."""
import sys
import os
from os.path import dirname as dirn
from typing import Final

from setuptools import find_packages

__all__ = ["packages"]

ROOTPATH: Final = dirn(dirn(os.path.abspath(__file__)))
path = os.path.join(ROOTPATH, "src")
packages = find_packages(path)
if packages == []:
    path = ROOTPATH
    packages = find_packages(path)
sys.path.insert(0, path)
