function! init#textobj#comment#source() abort
  let g:textobj_comment_no_default_key_mappings = 1
  call init#textobj#map('comment')
endfunction
