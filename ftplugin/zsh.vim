" override $VIMRUNTIME/ftplugin/zsh.vim
setlocal path=.,~/.local/share/zinit/plugins
nnoremap <silent><buffer> gK :echo system('zsh -ifc "autoload -Uz run-help; \run-help ' . expand('<cword>') . '"')<CR>
let &l:path .= substitute(expand('$FPATH'), ':', ',', 'g')

nnoremap <silent><buffer> gd :<C-U>execute 'edit' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/README.*')<CR>
nnoremap <silent><buffer> gD :<C-U>execute 'edit' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/*.plugin.zsh')<CR>
nnoremap <silent><buffer> <C-W>d :<C-U>execute 'split' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/README.*')<CR>
nnoremap <silent><buffer> <C-W>D :<C-U>execute 'split' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/*.plugin.zsh')<CR>
if exists('*nvim_open_win') || exists('*popup_create')
  nnoremap <silent><nowait><buffer> <LocalLeader> :call quickui#context#open(b:context, {})<CR>
  xnoremap <silent><nowait><buffer> <LocalLeader> :call quickui#context#open(b:context_v, {})<CR>
  let b:context = [
        \ ['&Echo', 'echo system("echo " . expand("<cWORD>"))'],
        \ ['E&xecute', 'echo system(expand("<cWORD>"))'],
        \ ]
  let b:context_v = [
        \ ['&Echo', 'echo system("echo " . getline(".")[col("v") - 1:col("''>")])'],
        \ ['E&xecute', 'echo system(getline(".")[col("v") - 1:col("''>")])'],
        \ ]
endif

call init#init#sh#map()
