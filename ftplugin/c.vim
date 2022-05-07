nnoremap <silent><buffer> <LocalLeader>e :<C-U>CocCommand clangd.switchSourceHeader<CR>
nnoremap <silent><buffer> <LocalLeader>s :<C-U>CocCommand clangd.switchSourceHeader split<CR>
nnoremap <silent><buffer> <LocalLeader>v :<C-U>CocCommand clangd.switchSourceHeader vsplit<CR>
nnoremap <silent><buffer> <LocalLeader>T :<C-U>CocCommand clangd.switchSourceHeader tabedit<CR>
nnoremap <silent><buffer> <LocalLeader>d :<C-U>CocCommand clangd.switchSourceHeader drop<CR>
nnoremap <silent><buffer> <LocalLeader>t :<C-U>CocCommand clangd.switchSourceHeader tab\ drop<CR>
nnoremap <silent><buffer> <LocalLeader>b :<C-U>CocCommand clangd.switchSourceHeader bdelete<CR>

if match(&filetype, '\.ifdef') == -1
  let &filetype .= '.ifdef'
  augroup init_c
    autocmd!
    autocmd FileType *.ifdef syntax on
          \ | Undefine \k\+
  augroup END
endif
