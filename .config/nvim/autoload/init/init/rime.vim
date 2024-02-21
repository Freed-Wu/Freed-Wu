function! init#init#rime#includeexpr() abort
  if !empty(findfile(v:fname))
    return v:fname
  endif
  return v:fname . '.yaml'
endfunction

function! init#init#rime#switch() abort
  if expand('%:t:r:e') ==# 'custom'
    let l:file = expand('%:t:r:r') . '.' . expand('%:e')
  else
    let l:file = expand('%:t:r') . '.custom.' . expand('%:e')
  endif
  let l:file = findfile(l:file)
  if l:file !=# ''
    execute 'edit' l:file
  endif
endfunction
