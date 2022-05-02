"""Models."""
from torch import nn
from torch import Tensor
from torchvision.models import resnet18


class XNet(nn.Module):
    """XNet."""

    def __init__(self, num_classes: int = 10):
        """__init__.

        :param num_classes:
        :type num_classes: int
        """
        super().__init__()
        self.backbone = nn.Sequential(*list(resnet18(True).children())[1:-1])
        out_features: int = self.backbone[0].num_features  # type: ignore
        self.conv = nn.Conv2d(1, out_features, 7, 2, 3, bias=False)
        in_features: int = self.backbone[-2][-1].bn2.num_features  # type: ignore
        self.fc = nn.Linear(in_features, num_classes)

    def forward(self, x) -> "Tensor":
        """forward.

        :param x:
        :rtype: "Tensor"
        """
        x = self.conv(x)
        x = self.backbone(x)
        x.squeeze_()
        x = self.fc(x)
        return x
