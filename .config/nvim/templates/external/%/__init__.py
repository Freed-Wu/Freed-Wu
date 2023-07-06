r"""Fake {{ expand('%:p:h:t') }}
========={{ repeat('=', len(expand('%:p:h:t'))) }}
"""
try:
    from {{ expand('%:p:h:t') }} import *  # type: ignore
except ImportError:
    from .__main__ import *
