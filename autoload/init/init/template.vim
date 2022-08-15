function! init#init#template#cfile() abort
  return substitute(expand('%:t:r'), '\%(-\|^\)\(.\)', '\u\1', 'g')
endfunction

function! init#init#template#file_() abort
  return substitute(expand('%:t'), '^_', '', 'g')
endfunction

function! init#init#template#github() abort
  return g:snips_github
endfunction
