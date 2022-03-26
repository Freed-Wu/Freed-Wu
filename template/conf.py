import os
import sys
from pathlib import Path

sys.path.insert(0, os.path.abspath("../src"))
# pyright:reportMissingImports=false
from foo import __version__ as VERSION  # noqa: E402
try:
    readme = next(iter(Path("..").glob("README*")))
    Path(readme.name).write_text(
        readme.read_text().replace("images/", "../images/")
    )
except Exception:
    pass
