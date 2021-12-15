#! /usr/bin/env python3
"""%HERE%.

usage: %FFILE% [-hV]

options:
    -h, --help                  Show this screen.
    -V, --version               Show version.
"""
if __name__ == "__main__" and __doc__:
    from docopt import docopt
    from typing import Dict, Union
    Arg = Union[bool, str]
    args: Dict[str, Arg] = docopt(__doc__, version="v0.0.1")
