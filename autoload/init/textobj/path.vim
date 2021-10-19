function! init#textobj#path#source() abort
  let g:textobj_path_no_default_key_mappings = 0
  call textobj#user#map('path', {
        \ 'prev_path': {
          \ 'select-a': 'aA',
          \ 'select-i': 'iA',
          \ },
          \ 'next_path': {
            \ 'select-a': 'anA',
            \ 'select-i': 'inA',
            \ },
            \ })
endfunction
