nnoremap <silent><buffer> [[ ?(ERROR)<CR>:let @/=''<CR>
nnoremap <silent><buffer> ]] /(ERROR)<CR>:let @/=''<CR>
nnoremap <silent><buffer> [] ?(ERROR)<CR>}:let @/=''<CR>
nnoremap <silent><buffer> ][ /(ERROR)<CR>{:let @/=''<CR>
nnoremap <silent><buffer> <LocalLeader>q :<C-U>!~/.local/share/nvim/repos/github.com/nvim-treesitter/nvim-treesitter/scripts/format-queries.lua %<CR>
