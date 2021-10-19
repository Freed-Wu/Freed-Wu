#! /usr/bin/env python3
"""Main."""
from torchtyping import patch_typeguard
from typeguard.importhook import install_import_hook

patch_typeguard()
install_import_hook("model")
install_import_hook("data")

if __name__ == "__main__":
    from pytorch_lightning.utilities.cli import LightningCLI
    from model import Net
    from data import Data
    cli = LightningCLI(Net, Data)
