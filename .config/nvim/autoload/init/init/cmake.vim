function! init#init#cmake#includeexpr() abort
  let l:fname = substitute(v:fname, '(\|)', '', 'g')
  return l:fname . '.cmake'
endfunction
