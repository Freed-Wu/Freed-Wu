function! init#textobj#path#source() abort
  let g:textobj_path_no_default_key_mappings = 0
  call init#textobj#map('path')
endfunction
