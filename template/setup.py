#! /usr/bin/env python3
"""A setuptools based setup module.

See:
https://packaging.python.org/guides/distributing-packages-using-setuptools/
https://github.com/pypa/sampleproject
"""

from setuptools import setup, find_packages
from pathlib import Path
from mimetypes import guess_type
from typing import Final
from importlib import import_module
from packaging.utils import canonicalize_name
import os
import sys
import shlex
import subprocess

HERE: Final = Path(__file__).parent.resolve()
try:
    readme = next(iter(HERE.glob("README*")))
    long_description = readme.read_text()
    long_description_content_type = guess_type(readme)[0]
except StopIteration:
    long_description = ""
    long_description_content_type = None
REQUIREMENTS: Final = HERE / "requirements.txt"
try:
    install_requires = REQUIREMENTS.read_text().splitlines()
except FileNotFoundError:
    install_requires = []

PACKAGES: Final = find_packages("src")
PACKAGE: Final = PACKAGES[0]
sys.path.insert(0, os.path.abspath("src"))
MODULE: Final = import_module(PACKAGE)
VERSION: Final = MODULE.__version__
NAME_: Final = MODULE.__name__
NAME: Final = canonicalize_name(NAME_)
VCS_URL: Final = f"%GITHUB%/{NAME}"
CMD: Final = f'gh repo view --json description -q .description {VCS_URL}'
ARGS: Final = shlex.split(CMD)
try:
    DESCRIPTION = subprocess.run(ARGS, capture_output=True).stdout.decode()
except FileNotFoundError:
    DESCRIPTION = ""

setup(
    name=NAME,
    version=VERSION,
    description=DESCRIPTION,
    long_description=long_description,
    long_description_content_type=long_description_content_type,
    url=f"https://pypi.org/project/{NAME}",
    download_url=f"{VCS_URL}/tags",
    project_urls={
        "Bug Reports": f"{VCS_URL}/issues",
        "Source": VCS_URL,
        "Homepage": f"https://{NAME}.readthedocs.io",
    },
    author="%USER%",
    author_email="%MAIL%",
    maintainer="%USER%",
    maintainer_email="%MAIL%",
    license="GPLv3",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Build Tools",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Programming Language :: Python :: 3 :: Only",
        "Programming Language :: Python :: 3",
    ]
    + [
        f"Programming Language :: Python :: 3.{minor}"
        for minor in range(6, 11)
    ],
    packages=PACKAGES,
    package_dir={"": "src"},
    include_package_data=True,
    python_requires=">=3.6",
    install_requires=install_requires,
    extras_require={
        "debug": ["rich"],
    },
    entry_points={
        "console_scripts": [
            f"{NAME}={NAME_}.__main__:main",
        ],
    },
    keywords="python",
)
