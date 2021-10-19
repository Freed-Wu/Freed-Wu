setlocal nowrap
setlocal colorcolumn=
setlocal expandtab
if empty(matchstr(getline(1), 'Gentoo System Manager''s Manual'))
  setlocal shiftwidth=7
  setlocal tabstop=7
else
  setlocal shiftwidth=5
  setlocal tabstop=5
endif
AnyFoldActivate

nnoremap <silent><buffer> [[ ?^\u\+<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ]] /^\u\+<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> [] ?^\u\+<CR>}:let @/ = ''<CR>
nnoremap <silent><buffer> [] /^\u\+<CR>{:let @/ = ''<CR>
