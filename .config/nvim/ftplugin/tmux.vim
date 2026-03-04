setlocal path=.,$TMUX_PLUGIN_MANAGER_PATH
if expand('%:p:t') ==# 'tmux.conf'
   setlocal includeexpr=init#init#zinit#includeexpr()
endif

nnoremap <silent><buffer> K :<C-U>call CocAction('doHover')<CR>
nnoremap <silent><buffer> gK :<C-U>call tmux#man()<CR>
nnoremap <silent><buffer> gd :<C-U>execute 'edit' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/README.*')<CR>
nnoremap <silent><buffer> gD :<C-U>execute 'edit' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/docs/*')<CR>
nnoremap <silent><buffer> <C-W>d :<C-U>execute 'split' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/README.*')<CR>
nnoremap <silent><buffer> <C-W>D :<C-U>execute 'split' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/docs/*')<CR>
nnoremap <silent><nowait><buffer> <LocalLeader> :call init#init#quickui#install('normal/tmux')<CR>
xnoremap <silent><nowait><buffer> <LocalLeader> :call init#init#quickui#install('visual/tmux')<CR>
