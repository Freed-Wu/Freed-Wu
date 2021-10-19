setlocal foldlevel=1
if expand('%:p') ==# $XDG_CONFIG_HOME . '/nvim/coc-settings.json'
  setlocal keywordprg=:let\ g:search=expand('<cword>')\|help\ coc-nvim.txt\|call\ search(g:search)\"
endif
nnoremap <silent><buffer> gd :<C-U>execute 'edit' glob(finddir(expand('<cfile>')) . '/R*.md')<CR>
nnoremap <silent><buffer> <C-W>d :<C-U>execute 'split' glob(finddir(expand('<cfile>')) . '/R*.md')<CR>
