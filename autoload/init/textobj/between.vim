function! init#textobj#between#source() abort
  let g:textobj_between_no_default_key_mappings = 1
  call textobj#user#map('between', {
        \ '-': {
          \ 'select-a': 'X',
          \ 'select-i': 'x',
          \ },
          \ })
endfunction
