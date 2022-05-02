"""Datasets."""
import os
import pandas as pd
from torch.utils.data import Dataset
from torchvision import transforms
from PIL import Image


class Data(Dataset):
    """Data."""

    def __init__(self, root: str = "", train: bool = True, transform=None):
        """__init__.

        :param root:
        :type root: str
        :param train:
        :type train: bool
        :param transform:
        """
        super().__init__()
        self.transform = transform if transform else transforms.ToTensor()
        self.dir = os.path.join(root, "train" if train else "val")
        self.train = train
        if self.train:
            self.df = pd.read_csv(
                os.path.join(self.dir, "tiny_train_map.txt"),
                delimiter="\t",
                header=None,  # type: ignore
            )
        else:
            self.df = pd.read_csv(
                os.path.join(self.dir, "tiny_val_map.txt"),
                delimiter="\t",
                header=None,  # type: ignore
            )

    def __getitem__(self, index: int):
        """__getitem__.

        :param index:
        :type index: int
        """
        img = Image.open(os.path.join(self.dir,
                                      self.df.iat[index, 0])  # type: ignore
                         )
        img = self.transform(img)
        return img, self.df.iat[index, 1]  # type: ignore

    def __len__(self):
        """__len__."""
        return len(self.df)
