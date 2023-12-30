r"""{{ substitute(substitute(expand('%:p:h:t'), '_\(.\)', ' \u\1', 'g'), '^\(.\)', '\u\1', '') }}
===={{ repeat('=', len(substitute(substitute(expand('%:p:h:t'), '_\(.\)', ' \u\1', 'g'), '^\(.\)', '\u\1', ''))) }}
"""

from . import {% here %}
