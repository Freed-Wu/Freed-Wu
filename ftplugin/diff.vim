call textobj#user#map('diff', {
      \ 'file': {
        \ 'select': '<buffer>iD',
        \ 'move-p': '<buffer>[[',
        \ 'move-n': '<buffer>]]',
        \ 'move-P': '<buffer>[]',
        \ 'move-N': '<buffer>][',
        \ },
        \ 'hunk': {
          \ 'select': '<buffer>id',
          \ 'move-p': '<buffer>[m',
          \ 'move-n': '<buffer>]m',
          \ 'move-P': '<buffer>[M',
          \ 'move-N': '<buffer>]M',
          \ },
          \ })
