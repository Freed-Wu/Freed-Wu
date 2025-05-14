setlocal path=.,~/.local/share/zinit/plugins,
let &l:path .= substitute(expand('$FPATH'), ':', ',', 'g')
if expand('%:p:t') ==# '.zshrc'
   setlocal includeexpr=init#init#zinit#includeexpr()
endif

" override $VIMRUNTIME/ftplugin/zsh.vim
nnoremap <silent><buffer> gK :echo system('zsh -ifc "autoload -Uz run-help; \run-help ' . expand('<cword>') . '"')<CR>
nnoremap <silent><buffer> gd :<C-U>execute 'edit' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/README.*')<CR>
nnoremap <silent><buffer> gD :<C-U>execute 'edit' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/*.plugin.zsh')<CR>
nnoremap <silent><buffer> <C-W>d :<C-U>execute 'split' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/README.*')<CR>
nnoremap <silent><buffer> <C-W>D :<C-U>execute 'split' glob(finddir(split(expand('<cfile>'), '/')[1]) . '/*.plugin.zsh')<CR>

call init#init#sh#map()
