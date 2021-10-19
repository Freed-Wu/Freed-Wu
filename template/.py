#! /usr/bin/env python3
"""%HERE%.

usage: %FFILE% [-hVd] [ [-v] | [-q|-qq] ] [<command>] [<args>]...

options:
    -h, --help          Show this screen.
    -V, --version       Show version.
    -d, --debug         Debug this program.
    -v, --verbose       Output verbosity.
    -q, --quiet         Redirect stdout to null. Again for stderr.

commands:
    help <command>      Show help of <command>.
"""
if __name__ == "__main__" and __doc__:
    from docopt import docopt
    from typing import Dict, Union, List
    import os

    _name = os.path.split(__file__)[-1]
    Arg = Union[bool, int, str, List[str]]
    args: Dict[str, Arg] = docopt(
        __doc__, version="v0.0.1", options_first=True)
    if args["--quiet"]:
        import sys

        sys.stdout = open(os.devnull, "w")
        if args["--quiet"] > 1:  # type: ignore
            sys.stderr = sys.stdout
    if args["--debug"]:
        print(args)
    if args["<args>"]:
        args["<args>"] = list(args["<args>"])  # type: ignore
    else:
        args["<args>"] = []
    if args["<command>"] in ["help"]:
        try:
            args["<command>"] = args["<args>"][0]
        except IndexError:
            exit(f"<command> is null. See '{_name} -h'.")
        args["<args>"][0] = "--help"
    else:
        exit(f"{args['<command>']} is an illegal command. See '{_name} -h'.")
    if args["--debug"]:
        print(args)
