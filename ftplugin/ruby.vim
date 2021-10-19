call textobj#user#map('ruby', {
      \ 'block': {
        \ 'select-a': '<buffer>aF',
        \ 'select-i': '<buffer>iF',
        \ },
        \ 'function': {
          \ 'select-a': '<buffer>af',
          \ 'select-i': '<buffer>if',
          \ },
          \ 'class': {
            \ 'select-a': '<buffer>ac',
            \ 'select-i': '<buffer>ic',
            \ },
            \ 'name': {
              \ 'select': '<buffer>it',
              \ },
              \ })
