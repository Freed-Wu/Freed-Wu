r"""Pudb Stringifier
====================
"""

from contextlib import suppress
from typing import Any

from pudb.var_view import default_stringifier

with suppress(ModuleNotFoundError):
    import torch

    class Tensor(torch.Tensor):
        """Describe ``torch.Tensor``."""

        def __init__(self, *args: Any, **kwargs: Any) -> None:
            """__init__.

            :param args:
            :type args: Any
            :param kwargs:
            :type kwargs: Any
            :rtype: None
            """
            super().__init__()
            self._shape = tuple(self.shape)
            self._range = ()
            # torch.complex(torch.ones(1), torch.ones(1)).min()
            # duck type
            # from_hp(torch.rand(1, 1), (1, 1), torch.int8).min()
            with suppress(RuntimeError, AttributeError, NotImplementedError):
                self._range += (self.min().item(),)
            # torch.tensor(1).mean()
            # duck type
            # from_hp(torch.rand(1, 1), (1, 1), torch.int8).mean()
            with suppress(RuntimeError, AttributeError, NotImplementedError):
                self._range += (self.mean().item(),)
            with suppress(RuntimeError, AttributeError, NotImplementedError):
                self._range += (self.max().item(),)

        def __repr__(self) -> str:  # type: ignore
            """__repr__.

            :rtype: str
            """
            range = self._range
            shape = self._shape
            texts = []
            if range:
                if isinstance(range[0], float):
                    text = (
                        "range=(" + ", ".join(f"{v:.3}" for v in range) + ")"
                    )
                else:
                    text = f"{range=}"
                texts += [text]
            texts += [f"{shape=}"]
            return f"{self.__class__.__name__}({', '.join(texts)})"


def pudb_stringifier(obj: Any) -> Any:
    """Pudb stringifier.

    :param obj:
    :type obj: Any
    :rtype: Any
    """
    try:
        import torch
        from torch.utils._pytree import tree_map_only

        return tree_map_only(
            lambda x: isinstance(x, torch.Tensor) and x.numel() > 3,
            Tensor,
            obj,
        )
    except ModuleNotFoundError:
        return default_stringifier(obj)
