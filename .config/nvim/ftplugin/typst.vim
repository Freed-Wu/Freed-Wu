let b:browser_search_default_engine = 'typst'

nnoremap <buffer> <LocalLeader>lv :<C-U>lua vim.ui.open(vim.fn.expand('%:p:r') .. '.pdf')<CR>
nnoremap <silent><buffer> ]] /^=\+ <CR>:let @/=''<CR>
nnoremap <silent><buffer> [[ ?^=\+ <CR>:let @/=''<CR>
