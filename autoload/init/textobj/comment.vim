function! init#textobj#comment#source() abort
  let g:textobj_comment_no_default_key_mappings = 1
  call textobj#user#map('comment', {
        \ '-': {
          \ 'select-a': 'ar',
          \ 'select-i': 'ir',
          \ },
          \ 'big': {
            \ 'select-a': 'aR',
            \ },
            \ })
endfunction
