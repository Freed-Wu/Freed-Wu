function! init#init#cmake#includeexpr(fname) abort
  if !empty(findfile(a:fname))
    return a:fname
  elseif !empty(findfile(a:fname . '.cmake'))
    return a:fname . '.cmake'
  elseif !empty(findfile(a:fname . '-config.cmake'))
    return a:fname . '-config.cmake'
  endif
  return 'Find' . a:fname . '.cmake'
endfunction
