"""My mostly used functions
===========================
"""
from __future__ import annotations

import random
from typing import TYPE_CHECKING, Callable, Optional

if TYPE_CHECKING:
    from fvcore.nn import FlopCountAnalysis
    from torch import Tensor, nn


class My:
    """My mostly used functions."""

    @staticmethod
    def params_M(net: "nn.Module", requires_grad: bool = True) -> float:
        """Get the parameters of network.

        :param net:
        :type net: "nn.Module"
        :param requires_grad:
        :type requires_grad: bool
        :rtype: float
        """
        s: int = 0
        for p in net.parameters():
            if requires_grad and p.requires_grad or not requires_grad:
                s += p.numel()
        return s / 1e6

    @staticmethod
    def flops_G(
        net: "nn.Module", *args: int
    ) -> tuple[float, "FlopCountAnalysis"]:
        """Get the FLOPs of network.

        :param net:
        :type net: "nn.Module"
        :param args:
        :type args: int
        :rtype: tuple[float, "FlopCountAnalysis"]
        """
        import torch
        from fvcore.nn import FlopCountAnalysis

        device = next(iter(net.parameters())).device
        input = torch.zeros(1, *args).to(device)
        flops = FlopCountAnalysis(net, (input,))
        return flops.total() / 1e9, flops

    @staticmethod
    def register_forward_hook(
        net: "nn.Module", hook: Optional[Callable] = None
    ) -> None:
        """Register forward hook.

        :param net:
        :type net: "nn.Module"
        :param hook:
        :type hook: Optional[Callable]
        :rtype: None
        """
        if hook is None:
            hook = My.hook
        for module in net.modules():
            module.register_forward_hook(hook)

    @staticmethod
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

    @staticmethod
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

    @staticmethod
    def plot(tensors: "Tensor") -> None:
        """Plot.

        :param tensors:
        :type tensors: "Tensor"
        :rtype: None
        """
        from matplotlib import pyplot as plt
        from torchvision.utils import make_grid

        img = (
            make_grid(tensors).permute(1, 2, 0).detach().cpu().float().numpy()
        )
        plt.imshow(img)
        plt.show()

    @staticmethod
    def seed_everything(seed: int = 0) -> None:
        """Seed everything.

        :param seed:
        :type seed: int
        :rtype: None
        """
        import numpy as np
        import torch

        random.seed(seed)
        torch.manual_seed(seed)
        torch.cuda.manual_seed_all(seed)

        np.random.seed(seed)


my = My()
