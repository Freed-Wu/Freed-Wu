setlocal spell

" cancel current git commit
nnoremap <buffer> ZQ ggdGZZ
inoremap <buffer> <M-N> <C-O>:lua require('git2.nvim.committia').scroll_window('<C-V><C-F>')<CR>
inoremap <buffer> <M-P> <C-O>:lua require('git2.nvim.committia').scroll_window('<C-V><C-B>')<CR>
