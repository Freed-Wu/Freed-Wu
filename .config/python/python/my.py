"""My mostly used functions
===========================
"""
import sys
from contextlib import suppress
from typing import TYPE_CHECKING, Callable

from .describe import describe

if TYPE_CHECKING:
    import numpy as np
    from torch import Tensor, nn

if "torch" in sys.modules:
    with suppress(ImportError):
        from torchinfo import summary

del sys, suppress


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


def plot(inputs: "Tensor | np.ndarray") -> None:
    r"""Plot tensors or array. Clip to $[0, 1]$ by default.

    :param inputs:
    :type inputs: Tensor | np.ndarray
    :rtype: None
    """
    import numpy as np
    from matplotlib import pyplot as plt

    if isinstance(inputs, np.ndarray):
        img = inputs
    else:
        from torchvision.utils import make_grid

        img = (
            make_grid(inputs.clip(0, 1))
            .permute(1, 2, 0)
            .detach()
            .cpu()
            .float()
            .numpy()
        )
    plt.imshow(img)
    plt.show()


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
