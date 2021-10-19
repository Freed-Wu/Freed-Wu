"""Data."""
import pytorch_lightning as pl
from torch.utils.data import random_split, DataLoader
from typing import Optional
from torchvision import transforms
from torchvision.datasets import MNIST


class Data(pl.LightningDataModule):
    """Data."""

    def __init__(self, data_dir: str = "", batch_size: int = 32,
                 num_workers: int = 4):
        """__init__.

        :param data_dir:
        :type data_dir: str
        :param batch_size:
        :type batch_size: int
        :param num_workers:
        :type num_workers: int
        """
        super().__init__()
        self.save_hyperparameters()
        self.transform = transforms.ToTensor()

    def setup(self, stage: Optional[str] = None):
        # noqa: D401
        """setup.

        :param stage:
        :type stage: Optional[str]
        """
        self.test_dataset = MNIST(self.hparams["data_dir"],
                                  download=True,
                                  train=False,
                                  transform=self.transform)
        full_dataset = MNIST(self.hparams["data_dir"],
                             download=True,
                             train=True,
                             transform=self.transform)
        self.train_dataset, self.val_dataset = random_split(full_dataset,
                                                            [55000, 5000])

    def train_dataloader(self):
        """train_dataloader."""
        return DataLoader(self.train_dataset,
                          batch_size=self.hparams["batch_size"],
                          num_workers=self.hparams["num_workers"])

    def val_dataloader(self):
        """val_dataloader."""
        return DataLoader(self.val_dataset,
                          batch_size=self.hparams["batch_size"],
                          num_workers=self.hparams["num_workers"])

    def test_dataloader(self):
        """test_dataloader."""
        return DataLoader(self.test_dataset,
                          batch_size=self.hparams["batch_size"],
                          num_workers=self.hparams["num_workers"])
