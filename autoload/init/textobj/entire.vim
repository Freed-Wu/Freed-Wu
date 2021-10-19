function! init#textobj#entire#source() abort
  let g:textobj_entire_no_default_key_mappings = 1
  call textobj#user#map('entire', {
        \ '-': {
          \ 'select-a': 'a0',
          \ 'select-i': 'i0',
          \ },
          \ })
endfunction
