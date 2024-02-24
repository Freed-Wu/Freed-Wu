function! init#init#rime#includeexpr(fname) abort
  " fname.yaml:/node/child_node/...
  let l:fname = split(a:fname, ':')[0]
  if !empty(findfile(l:fname))
    return l:fname
  endif
  let l:fname = l:fname . '.yaml'
  " fname:/node/child_node/...
  if !empty(findfile(l:fname))
    return l:fname
  endif
  return a:fname
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
