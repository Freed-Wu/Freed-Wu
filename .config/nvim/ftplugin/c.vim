call init#init#c#main()

nnoremap <silent><buffer> <LocalLeader>e :<C-U>CocCommand clangd.switchSourceHeader<CR>
nnoremap <silent><buffer> <LocalLeader>s :<C-U>CocCommand clangd.switchSourceHeader split<CR>
nnoremap <silent><buffer> <LocalLeader>v :<C-U>CocCommand clangd.switchSourceHeader vsplit<CR>
nnoremap <silent><buffer> <LocalLeader>T :<C-U>CocCommand clangd.switchSourceHeader tabedit<CR>
nnoremap <silent><buffer> <LocalLeader>d :<C-U>CocCommand clangd.switchSourceHeader drop<CR>
nnoremap <silent><buffer> <LocalLeader>t :<C-U>CocCommand clangd.switchSourceHeader tab\ drop<CR>
nnoremap <silent><buffer> <LocalLeader>b :<C-U>CocCommand clangd.switchSourceHeader bdelete<CR>
