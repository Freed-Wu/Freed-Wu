"""Fake shtab."""
from argparse import Action, ArgumentParser
from typing import Any, Dict, List

FILE = None
DIRECTORY = DIR = None


class PrintCompletionAction(Action):
    """PrintCompletionAction."""

    def __call__(self, parser, namespace, values, option_string=None):
        """__call__.

        :param parser:
        :param namespace:
        :param values:
        :param option_string:
        """
        print("Please install shtab firstly!")
        parser.exit(0)


def add_argument_to(
    parser: ArgumentParser, *args: List[Any], **kwargs: Dict[str, Any]
):
    """add_argument_to.

    :param parser:
    :type parser: ArgumentParser
    :param args:
    :type args: List[Any]
    :param kwargs:
    :type kwargs: Dict[str, Any]
    """
    Action.complete = None  # type: ignore
    parser.add_argument(
        "--print-completion",
        choices=["bash", "zsh", "tcsh"],
        action=PrintCompletionAction,
        help="print shell completion script",
    )
    return parser
