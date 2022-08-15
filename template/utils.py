# noqa: D400
"""utils"""
from torch import nn
import torch
import math
import logging

logger = logging.getLogger(__name__)


class RateDistortionLoss(nn.Module):
    """Custom rate distortion loss with a Lagrangian parameter."""

    def __init__(self, lmbda: float = 1e-2):
        """__init__.

        :param lmbda:
        :type lmbda: float
        """
        super().__init__()
        self.mse = nn.MSELoss()
        self.lmbda = lmbda

    def forward(self, output, target):
        """forward.

        :param output:
        :param target:
        """
        N, _, H, W = target.size()
        out = {}
        num_pixels = N * H * W

        out["bpp_loss"] = sum(
            (torch.log(likelihoods).sum() / (-math.log(2) * num_pixels))
            for likelihoods in output["likelihoods"].values()
        )
        out["mse_loss"] = self.mse(output["x_hat"], target)
        out["loss"] = self.lmbda * 255**2 * out["mse_loss"] + out["bpp_loss"]

        return out


class AverageMeter:
    """Compute running average."""

    def __init__(self):
        """__init__."""
        self.val = 0
        self.avg = 0
        self.sum = 0
        self.count = 0

    def update(self, val, n: int = 1):
        """update.

        :param val:
        :param n:
        :type n: int
        """
        self.val = val
        self.sum += val * n
        self.count += n
        self.avg = self.sum / self.count
