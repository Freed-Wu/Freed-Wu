setlocal foldlevel=1
if expand('%:p') ==# expand('$XDG_CONFIG_HOME/nvim/coc-settings.json')
  setlocal keywordprg=:call\ init#init#coc#keywordprg(expand('<cWORD>')[:-2])
  setlocal path=~/.config/coc/extensions/node_modules
  setlocal includeexpr=init#init#coc#includeexpr()
  setlocal isfname-=.

  nnoremap <silent><buffer> gd :<C-U>execute 'edit' glob(finddir('coc-' . expand('<cfile>')) . '/R*.md')<CR>
  nnoremap <silent><buffer> <C-W>d :<C-U>execute 'split' glob(finddir('coc-' . expand('<cfile>')) . '/R*.md')<CR>
endif
