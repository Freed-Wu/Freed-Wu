r"""Image
=========
"""
import numpy as np


def convert_images(inputs: "Tensor | np.ndarray") -> np.ndarray:
    """Convert images.

    :param inputs:
    :type inputs: "Tensor | np.ndarray"
    :rtype: np.ndarray
    """
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
    return img
