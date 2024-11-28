setlocal colorcolumn=
setlocal nofoldenable
setlocal textwidth=0
setlocal noautoindent

let b:browser_search_default_engine = 'google'

nnoremap <buffer> <LocalLeader>lv :<C-U>lua vim.ui.open(vim.fn.expand('%:p:r') .. '.pdf')<CR>
nnoremap <silent><buffer> ]] /^\d\+\. <CR>:let @/=''<CR>
nnoremap <silent><buffer> [[ ?^\d\+\. <CR>:let @/=''<CR>
