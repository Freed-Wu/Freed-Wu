r"""Describe
============
"""

from contextlib import suppress
from typing import TYPE_CHECKING, Any

if TYPE_CHECKING:
    import torch


class Describe:
    """Describe."""

    def __init__(
        self,
        device: "torch.device",
        dtype: "torch.dtype",
        requires_grad: bool = False,
        min: float | None = None,
        max: float | None = None,
        var: float | None = None,
        mean: float | None = None,
    ) -> None:
        """Init.

        :param device:
        :type device: "torch.device"
        :param dtype:
        :type dtype: "torch.dtype"
        :param requires_grad:
        :type requires_grad: bool
        :param min:
        :type min: float | None
        :param max:
        :type max: float | None
        :param var:
        :type var: float | None
        :param mean:
        :type mean: float | None
        :rtype: None
        """
        import torch

        self.device = device
        self.dtype = dtype
        self.requires_grad = requires_grad
        self.min = min
        self.max = max
        self.var = var
        self.mean = mean
        attrs = []
        for k in [
            "min",
            "max",
            "mean",
            "var",
            "device",
            "dtype",
            "requires_grad",
        ]:
            if (
                k == "requires_grad" and self.requires_grad
            ) or k != "requires_grad":
                attrs += [k]
        texts = []
        for k in attrs:
            v = getattr(self, k)
            if v is None:
                continue
            elif isinstance(v, bool):
                text = k
            elif isinstance(v, float):
                text = f"{k}={v:.2}"
            elif isinstance(v, torch.device):
                suffix = "" if v.index is None else f":{v.index}"
                text = f"{v.type}" + suffix
                if text == "cpu":
                    continue
            elif isinstance(v, torch.dtype):
                text = f"{v}".split(".")[-1]
            else:
                text = f"{k}={v}"
            texts += [text]
        self.repr = f"tensor({', '.join(texts)})"

    def __eq__(self, that) -> bool:
        """Eq.

        :param that:
        :rtype: bool
        """
        if (
            self.device == that.device
            and self.dtype == that.dtype
            and self.requires_grad == that.requires_grad
            and self.min == that.min
            and self.max == that.max
            and self.var == that.var
            and self.mean == that.mean
        ):
            return True
        return False

    def __repr__(self) -> str:
        """Repr.

        :rtype: str
        """
        return self.repr


def describe(
    obj: object,
    min: bool = True,
    max: bool = True,
    mean: bool = True,
    var: bool = True,
    device: bool = True,
    dtype: bool = True,
    requires_grad: bool = True,
) -> Any:
    """Describe.

    :param obj:
    :type obj: object
    :param min:
    :type min: bool
    :param max:
    :type max: bool
    :param mean:
    :type mean: bool
    :param var:
    :type var: bool
    :param device:
    :type device: bool
    :param dtype:
    :type dtype: bool
    :param requires_grad:
    :type requires_grad: bool
    :rtype: Any
    """
    import torch

    if isinstance(obj, torch.Tensor):
        kwargs: dict[
            str, str | bool | float | torch.device | torch.dtype | None
        ] = {}
        if not torch.is_complex(obj):
            if min:
                kwargs["min"] = obj.min().item()
            if max:
                kwargs["max"] = obj.max().item()
        with suppress(RuntimeError):
            if var:
                _mean, _var = torch.var_mean(obj)
                if mean:
                    kwargs["mean"] = _mean.item()
                kwargs["var"] = _var.item()
            elif mean:
                kwargs["mean"] = obj.mean().item()
                kwargs["var"] = None
        if device:
            kwargs["device"] = obj.device
        if dtype:
            kwargs["dtype"] = obj.dtype
        if requires_grad:
            kwargs["requires_grad"] = obj.requires_grad
        return Describe(**kwargs)  # type: ignore
    elif isinstance(obj, dict):
        d = {}
        for k, v in obj.items():
            d[k] = describe(v)
        return d
    elif isinstance(obj, list):
        return [describe(v) for v in obj]
    else:
        return obj
