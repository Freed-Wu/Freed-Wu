function! init#textobj#chunk#source() abort
  let g:textobj_chunk_no_default_key_mappings = 1
  call init#textobj#map('chunk')
endfunction
