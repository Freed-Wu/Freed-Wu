function! init#textobj#between#source() abort
  let g:textobj_between_no_default_key_mappings = 1
  call init#textobj#map('between')
endfunction
