"""My mostly used functions
===========================
"""
import sys
from contextlib import suppress
from dataclasses import dataclass
from typing import TYPE_CHECKING

from .describe import describe
from .image import inputs2tensors

if TYPE_CHECKING:
    from typing import Callable

    import numpy as np
    from torch import Tensor, nn

if "torch" in sys.modules:
    with suppress(ImportError):
        from torchinfo import summary


@dataclass
class T:
    r"""T."""

    hours: int = 0
    minutes: int = 0

    def __post_init__(self):
        r"""Post init."""
        self.hours += self.minutes // 60
        self.minutes %= 60

    def __add__(self, that: "T") -> "T":
        r"""Add.

        :param that:
        :type that: T
        :rtype: "T"
        """
        minutes = self.minutes + that.minutes
        return T(self.hours + that.hours + minutes // 60, minutes % 60)


del TYPE_CHECKING, sys, suppress, dataclass


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


def register_forward_hook(net: "nn.Module", hook: "Callable" = hook) -> None:
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


def plot(
    inputs: "Tensor | np.ndarray | list[str] | str", show: bool = True
) -> None:
    r"""Plot tensors or array. Clip to $[0, 1]$ by default.

    :param inputs:
    :type inputs: "Tensor | np.ndarray | list[str] | str"
    :param show:
    :type show: bool
    :rtype: None
    """
    from matplotlib import pyplot as plt

    from .image import inputs2ndarray

    img = inputs2ndarray(inputs)
    plt.imshow(img)
    if show:
        plt.show()


def hist(
    inputs: "Tensor | list[str] | str", channel: int = 0, show: bool = True
) -> None:
    """Hist.

    :param inputs:
    :type inputs: "Tensor | list[str] | str"
    :param channel:
    :type channel: int
    :param show:
    :type show: bool
    :rtype: None
    """
    from matplotlib import pyplot as plt

    channels = ["R", "G", "B"]
    tensors = inputs2tensors(inputs)
    plt.hist(tensors[:, channel].flatten().detach().cpu().float().numpy(), 256)
    plt.xlabel("pixel")
    plt.ylabel("frequency")
    plt.title(channels[channel])
    if show:
        plt.show()


def save(
    inputs: "Tensor | np.ndarray | list[str] | str", fname: str = "a.png"
) -> None:
    r"""Save tensors or array. Clip to $[0, 1]$ by default.

    :param inputs:
    :type inputs: Tensor | np.ndarray | list[str] | str
    :param fname:
    :type fname: str
    :rtype: None
    """
    from matplotlib import pyplot as plt

    from .image import inputs2ndarray

    img = inputs2ndarray(inputs)
    plt.imsave(fname, img)


def patch_images(
    samples: "Tensor", ratio: int = 1, S: int = 64
) -> tuple["Tensor", list[int]]:
    """Patch images.

    :param samples:
    :type samples: "Tensor"
    :param ratio:
    :type ratio: int
    :param S:
    :type S: int
    :rtype: tuple["Tensor", list[int]]
    """
    import math

    from torchvision.transforms.functional import pad

    h, w = samples.shape[-2:]
    h_pad = S * math.ceil(h / S) - h
    w_pad = S * math.ceil(w / S) - w
    l_pad, u_pad = w_pad // 2, h_pad // 2
    r_pad, d_pad = w_pad - l_pad, h_pad - u_pad
    pad_param = [l_pad, u_pad, r_pad, d_pad]
    samples = pad(samples, pad_param)
    crop_param = [ratio * u_pad, ratio * l_pad, ratio * h, ratio * w]
    return samples, crop_param


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
