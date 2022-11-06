function! init#textobj#continuous_line#source() abort
  let g:textobj_continuous_line_no_default_mappings = 1
  call init#textobj#map('continuous')
endfunction
