function! init#init#sphinx#set() abort
  if filereadable(expand('%:p:h') . '/conf.py')
    compiler sphinx
    nnoremap <buffer> <LocalLeader>lv :<C-U>call pandoc#hypertext#OpenSystem(expand('%:p:h') . '/_build/html/index.html')<CR>
  endif
endfunction
