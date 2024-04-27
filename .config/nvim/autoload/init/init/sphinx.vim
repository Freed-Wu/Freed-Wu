function! init#init#sphinx#set() abort
  if filereadable(expand('%:p:h') . '/conf.py')
    compiler sphinx
    if has('nvim')
      nnoremap <buffer> <LocalLeader>lv :<C-U>lua vim.ui.open(vim.fn.expand('%:p:h') .. '/_build/html/index.html')<CR>
    endif
  endif
endfunction
