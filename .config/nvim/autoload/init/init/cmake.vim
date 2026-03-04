function! init#init#cmake#includeexpr() abort
  if !empty(findfile(v:fname))
    return v:fname
  elseif !empty(findfile(v:fname . '.cmake'))
    return v:fname . '.cmake'
  elseif !empty(findfile(v:fname . '-config.cmake'))
    return v:fname . '-config.cmake'
  endif
  return 'Find' . v:fname . '.cmake'
endfunction
