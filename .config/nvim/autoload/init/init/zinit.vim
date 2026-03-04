function! init#init#zinit#includeexpr() abort
  if findfile(v:fname)
    return v:fname
  endif
  return split(v:fname, '/')[-1]
endfunction
