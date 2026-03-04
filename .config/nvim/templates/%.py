r"""{{ substitute(trim(substitute(expand('%:t:r'), '_\(.\)', ' \u\1', 'g')), '^\(.\)', '\u\1', '') }}
===={{ repeat('=', len(substitute(trim(substitute(expand('%:t:r'), '_\(.\)', ' \u\1', 'g')), '^\(.\)', '\u\1', ''))) }}
"""
import logging
import os
import sys

logger = logging.getLogger(__name__)
if not getattr(sys, "ps1", None):
    os.chdir(os.path.dirname(__file__))
{% here %}
