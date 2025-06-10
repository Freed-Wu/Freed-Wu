r"""Test patch_images"""

import math

import torch
from main.my import patch_images
from torchvision.transforms.functional import crop


class Test:
    r"""Test."""

    @staticmethod
    def test_patch_images() -> None:
        r"""Test patch images.

        :rtype: None
        """
        shapes = [[1, 3, 512, 512], [1, 1, 63, 63]]
        for shape in shapes:
            samples = torch.arange(math.prod(shape)).reshape(*shape)
            inputs, crop_param = patch_images(samples)
            outputs = crop(inputs, *crop_param)
            assert (outputs == samples).all()

    @staticmethod
    def test_patch_images_sr() -> None:
        r"""Test patch images sr.

        :rtype: None
        """
        shapes = [[1, 3, 512, 512], [1, 1, 63, 63]]
        for shape in shapes:
            new_shape = shape[0:2] + [shape[2] * 2] + [shape[3] * 2]
            samples = torch.arange(math.prod(shape)).reshape(*shape)
            inputs, crop_param = patch_images(samples, 2)
            outputs = crop(inputs, *crop_param)
            assert list(outputs.shape) == new_shape
