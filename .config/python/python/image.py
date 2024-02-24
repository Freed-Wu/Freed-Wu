r"""Image
=========
"""

import os
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    import numpy as np
    from torch import Tensor


def inputs2tensors(
    inputs: "Tensor | list[str] | str",
) -> "Tensor":
    r"""Inputs2tensors.

    :param inputs:
    :type inputs: Tensor | list[str] | str
    :rtype: "Tensor"
    """
    from torch import Tensor

    if isinstance(inputs, Tensor):
        img = inputs
    elif isinstance(inputs, list):
        import torch

        tensors = torch.cat([str2tensor(input) for input in inputs])
        img = tensors
    elif isinstance(inputs, str):
        img = str2tensor(inputs).unsqueeze(0)
    else:
        raise NotImplementedError
    return img


def inputs2ndarray(
    inputs: "Tensor | np.ndarray | list[str] | str",
) -> "np.ndarray":
    r"""Convert inputs to ndarray.

    :param inputs:
    :type inputs: Tensor | np.ndarray | list[str] | str
    :rtype: np.ndarray
    """
    import numpy as np

    if isinstance(inputs, np.ndarray):
        img = inputs
    else:
        img = tensors2numpy(inputs2tensors(inputs))
    return img


def tensors2numpy(inputs: "Tensor") -> "np.ndarray":
    r"""Tensors to numpy.

    :param inputs:
    :type inputs: Tensor
    :rtype: np.ndarray
    """
    from torchvision.utils import make_grid

    # float() avoid float16
    img = make_grid(inputs.clip(0, 1)).permute(1, 2, 0).detach().cpu().float().numpy()
    return img


def str2tensor(input: str) -> "Tensor":
    r"""Str to tensor.

    :param input:
    :type input: str
    :rtype: Tensor
    """
    from PIL import Image
    from torchvision.transforms import ToTensor

    img = ToTensor()(Image.open(os.path.expanduser(input)).convert("RGB"))
    return img
