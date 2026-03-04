function! init#init#bitbake#includeexpr() abort
  let l:fname = v:fname . '.bbclass'
  if findfile(l:fname)
    return l:fname
  endif
  return v:fname
endfunction
