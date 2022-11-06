function! init#textobj#entire#source() abort
  let g:textobj_entire_no_default_key_mappings = 1
  call init#textobj#map('entire')
endfunction
