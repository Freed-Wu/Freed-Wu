function! init#init#cmake#includeexpr(fname) abort
  return 'Find' . a:fname . '.cmake'
endfunction
