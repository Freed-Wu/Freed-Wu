#!/usr/bin/env python
"""A setuptools based setup module.

See:
https://packaging.python.org/guides/distributing-packages-using-setuptools/
https://github.com/pypa/sampleproject
"""

from glob import glob
from importlib import import_module
from mimetypes import guess_type
import os
from os.path import dirname as dirn
from pathlib import Path
import shlex
import subprocess
import sys
from typing import Final

from packaging.utils import canonicalize_name
from setuptools import find_packages, setup

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
extras_require = {}
for file in glob("requirements/*.txt"):
    name = os.path.basename(file)[:-4]
    extras_require[name] = Path(file).read_text().splitlines()
extras_require["all"] = sum(extras_require.values(), [])

rootpath = dirn(os.path.abspath(__file__))
path = os.path.join(rootpath, "src")
packages = find_packages(path)
if packages == []:
    path = rootpath
    packages = find_packages(path)
    package_dir = {"": "."}
else:
    package_dir = {"": "src"}
PACKAGE_DIR: Final = package_dir
sys.path.insert(0, path)
PACKAGES: Final = packages
PACKAGE: Final = PACKAGES[0]
MODULE: Final = import_module(PACKAGE)
VERSION: Final = MODULE.__version__
NAME_: Final = MODULE.__name__
NAME: Final = canonicalize_name(NAME_)
VCS_URL: Final = f"https://github.com/Freed-Wu/{NAME}"
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
    author="Wu Zhenyu",
    author_email="wuzy01@qq.com",
    maintainer="Wu Zhenyu",
    maintainer_email="wuzy01@qq.com",
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
        for minor in range(7, 12)
    ],
    packages=PACKAGES,
    package_dir=PACKAGE_DIR,
    include_package_data=True,
    python_requires=">=3.6",
    install_requires=install_requires,
    extras_require=extras_require,
    entry_points={
        "console_scripts": [
            f"{NAME}={NAME_}.__main__:main",
        ],
    },
    keywords="python",
)
