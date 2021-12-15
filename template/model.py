"""Model."""
import torch
from torch import nn
from torch.nn import functional as F
import pytorch_lightning as pl
from torchtyping import TensorType
from typing import List
from torch import Tensor


class Net(pl.LightningModule):
    """Net."""

    def __init__(self, lr: float = 0.001):
        """__init__.

        :param lr:
        :type lr: float
        """
        super().__init__()
        self.save_hyperparameters()
        self.l1 = nn.Linear(28 * 28, 10)

    def configure_optimizers(self):
        """configure_optimizers."""
        return torch.optim.Adam(self.parameters(), lr=self.hparams["lr"])

    def forward(
        self,
        x: TensorType["batch", "x_channels", "h", "w"],
    ) -> TensorType["batch", "y_channels"]:
        """forward.

        :param x:
        :type x: TensorType["batch", "x_channels", "h", "w"]
        :rtype: TensorType["batch", "y_channels"]
        """
        return torch.relu(self.l1(x.view(x.size(0), -1)))

    def _calculate_loss(self, batch: List["Tensor"], mode="train"):
        x, y = batch
        y_hat = self(x)
        loss = F.cross_entropy(y_hat, y)
        acc = (y == y_hat.argmax(-1)).float().mean()
        self.log(f"{mode}_loss", loss)
        self.log(f"{mode}_acc", acc, on_step=False, on_epoch=True)
        return loss, acc

    def training_step(self, batch: List["Tensor"], batch_idx: int):
        """training_step.

        :param batch:
        :type batch: List["Tensor"]
        :param batch_idx:
        :type batch_idx: int
        """
        loss, _ = self._calculate_loss(batch, mode="train")
        return loss

    def validation_step(self, batch: List["Tensor"], batch_idx: int):
        """validation_step.

        :param batch:
        :type batch: List["Tensor"]
        :param batch_idx:
        :type batch_idx: int
        """
        _ = self._calculate_loss(batch, mode="val")

    def test_step(self, batch: List["Tensor"], batch_idx: int):
        """test_step.

        :param batch:
        :type batch: List["Tensor"]
        :param batch_idx:
        :type batch_idx: int
        """
        _ = self._calculate_loss(batch, mode="test")
