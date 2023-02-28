for s:dir in g:template#directories
  if expand('%:p:h') ==# s:dir
    call init#init#vim#map()
  endif
endfor
