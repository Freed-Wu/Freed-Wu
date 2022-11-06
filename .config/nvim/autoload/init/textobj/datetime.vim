function! init#textobj#datetime#source() abort
  let g:textobj_datetime_no_default_key_mappings = 1
  call init#textobj#map('datetime')
endfunction
