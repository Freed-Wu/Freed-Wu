function! init#init#template#file_() abort
  return substitute(expand('%:t'), '^_', '', 'g')
endfunction

function! init#init#template#github() abort
  return g:snips_github
endfunction
