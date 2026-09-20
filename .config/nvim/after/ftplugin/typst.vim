if expand('%:p:r') =~# '^zhihu://'
  let b:browser_search_default_engine = 'zhihu'
else
  let b:browser_search_default_engine = 'typst'
endif

nnoremap <buffer> <LocalLeader>lv :<C-U>lua vim.ui.open(vim.fn.expand('%:p:r') .. '.pdf')<CR>
