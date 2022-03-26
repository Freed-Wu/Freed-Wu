function! init#init#git#includeexpr() abort
  let l:fname = substitute(v:fname, '^\(a\|b\)/', '', 'g')
  let l:file = findfile(l:fname)
  if !empty(l:file)
    return l:file
  else
    let l:dir = finddir(l:fname)
    if !empty(l:dir)
      return l:dir
    endif
  endif
  return l:fname
endfunction
