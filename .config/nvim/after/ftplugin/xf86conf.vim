setlocal tabstop=4
setlocal shiftwidth=4

nnoremap <silent><buffer> [[ ?\v^Section<CR>:let @/=''<CR>
nnoremap <silent><buffer> ]] /\v^EndSection<CR>:let @/=''<CR>
nnoremap <silent><buffer> [] ?\v^EndSection<CR>}:let @/=''<CR>
nnoremap <silent><buffer> ][ /\v^Section<CR>{:let @/=''<CR>
