setlocal path=.,$TMUX_PLUGIN_MANAGER_PATH

nnoremap <silent><buffer> K :<C-U>call CocAction('doHover')<CR>
nnoremap <silent><buffer> gK :<C-U>call tmux#man()<CR>
nnoremap <silent><buffer> gd :<C-U>execute 'edit' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/README.*')<CR>
nnoremap <silent><buffer> gD :<C-U>execute 'edit' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/docs/*')<CR>
nnoremap <silent><buffer> <C-W>d :<C-U>execute 'split' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/README.*')<CR>
nnoremap <silent><buffer> <C-W>D :<C-U>execute 'split' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/docs/*')<CR>
if exists('*nvim_open_win') || exists('*popup_create')
  nnoremap <silent><nowait><buffer> <LocalLeader> :call quickui#context#open(b:context, {})<CR>
  xnoremap <silent><nowait><buffer> <LocalLeader> :call quickui#context#open(b:context_v, {})<CR>
  let b:context = [
        \ ['&Echo', 'echo system("tmux show -g " . expand("<cWORD>"))'],
        \ ['E&xecute', 'echo system("tmux " . getline(line(".")))'],
        \ ]
  let b:context_v = [
        \ ['&Echo', 'echo system("tmux show -g " . getline(line("v"),line("''>") - 1))'],
        \ ['E&xecute', 'echo system("tmux " . getline(line("v"),line("''>") - 1))'],
        \ ]
endif
