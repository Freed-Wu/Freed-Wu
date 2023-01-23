"""My mostly used functions
===========================
"""
from typing import TYPE_CHECKING, Callable

if TYPE_CHECKING:
    from torch import Tensor, nn


def hook(module: "nn.Module", input: "Tensor", output: "Tensor") -> None:
    """Provide a hook function.

    :param module:
    :type module: "nn.Module"
    :param input:
    :type input: "Tensor"
    :param output:
    :type output: "Tensor"
    :rtype: None
    """
    print(list(output.shape))


def register_forward_hook(net: "nn.Module", hook: Callable = hook) -> None:
    """Register forward hook.

    :param net:
    :type net: "nn.Module"
    :param hook:
    :type hook: Callable
    :rtype: None
    """
    for module in net.modules():
        module.register_forward_hook(hook)


def calc_batch_size(
    b1: int,
    m1: float,
    b2: int,
    m2: float,
    m_G: float = 24,
    b_wanted: int = 0,
    mem_safe: float = 200,
) -> tuple[int, float]:
    """Calculate the maximal batch size.

    :param b1:
    :type b1: int
    :param m1:
    :type m1: float
    :param b2:
    :type b2: int
    :param m2:
    :type m2: float
    :param m_G:
    :type m_G: float
    :param b_wanted:
    :type b_wanted: int
    :param mem_safe:
    :type mem_safe: float
    :rtype: tuple[int, float]
    """
    k = abs(b2 - b1) / abs(m2 - m1)
    m_rest_max = m_G * 1000 - max(m1, m2)
    b_max = max(b1, b2) + m_rest_max * k
    if b_wanted == 0:
        b = int(b_max // 8 * 8)
    else:
        b = b_wanted
    m_rest = (b_max - b) / k
    while m_rest < mem_safe:
        b -= 8
        m_rest = (b_max - b) / k
    return b, m_rest


def plot(tensors: "Tensor") -> None:
    """Plot.

    :param tensors:
    :type tensors: "Tensor"
    :rtype: None
    """
    from matplotlib import pyplot as plt
    from torchvision.utils import make_grid

    img = make_grid(tensors).permute(1, 2, 0).detach().cpu().float().numpy()
    plt.imshow(img)
    plt.show()


def describe(
    obj: object,
    min: bool = True,
    max: bool = True,
    mean: bool = True,
    var: bool = True,
    device: bool = True,
    dtype: bool = True,
) -> str:
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
    :rtype: str
    """
    import torch

    if isinstance(obj, torch.Tensor):
        attrs: list[str] = []
        if min:
            attrs += [f"min={obj.min():.2}"]
        if max:
            attrs += [f"max={obj.max():.2}"]
        if var:
            _mean, _var = torch.var_mean(obj)
            if mean:
                attrs += [f"mean={_mean:.2}"]
            attrs += [f"var={_var:.2}"]
        elif mean:
            attrs += [f"mean={obj.mean():.2}"]
        if device:
            attrs += [f"device={obj.device}"]
        if dtype:
            attrs += ["dtype=" + f"{obj.dtype}".split(".")[-1]]
        return f"tensor({', '.join(attrs)})"
    elif isinstance(obj, dict):
        dic = {}
        for k, v in obj.items():
            pass
        return ""
    elif isinstance(obj, list):
        return ""
    else:
        return ""


def seed_everything(seed: int = 0) -> None:
    """Seed everything.

    :param seed:
    :type seed: int
    :rtype: None
    """
    import random

    import numpy as np
    import torch

    random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)

    np.random.seed(seed)


del TYPE_CHECKING, Callable
