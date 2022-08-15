"""Datasets."""
import os
import pandas as pd
from torch.utils.data import Dataset
from torchvision import transforms
from jpeg4py import JPEG


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
        path = os.path.join(self.dir, self.df.iat[index, 0])  # type: ignore
        img = JPEG(path).decode()
        # img = cv2.cvtColor(cv2.imread(path), cv2.COLOR_BGR2RGB)  # type: ignore
        img = self.transform(img)
        return img, self.df.iat[index, 1]  # type: ignore

    def __len__(self):
        """__len__."""
        return len(self.df)
