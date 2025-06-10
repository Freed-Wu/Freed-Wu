r"""Test describe"""

import torch
from main.describe import Describe, describe


class Test:
    r"""Test."""

    @staticmethod
    def test_describe_tensor() -> None:
        r"""Test describe tensor.

        :rtype: None
        """
        A = torch.arange(16).reshape(4, 4)
        result = describe(A)
        expected = Describe(
            device=torch.device("cpu"),
            dtype=torch.int64,
            min=0,
            max=15,
        )
        assert result == expected

    @staticmethod
    def test_describe_list() -> None:
        r"""Test describe list.

        :rtype: None
        """
        A = torch.arange(16).reshape(4, 4)
        result = describe([A, [A]])
        assert result == [describe(A), [describe(A)]]

    @staticmethod
    def test_describe_dict() -> None:
        r"""Test describe dict.

        :rtype: None
        """
        A = torch.arange(16).reshape(4, 4)
        result = describe({1: A})
        assert result == {1: describe(A)}
