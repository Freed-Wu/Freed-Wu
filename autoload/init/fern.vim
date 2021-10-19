function! init#fern#source() abort
  let g:fern#renderer = 'nerdfont'
  let g:fern#mark_symbol = '✓'
  let g:fern#disable_default_mappings = 1
  nnoremap <silent> <C-W>n <C-W>n:Fern .<CR>
  nnoremap <silent> <C-W>m :vnew<CR>:Fern .<CR>
  xnoremap <silent> <C-W>n <C-W>n:Fern .<CR>
  xnoremap <silent> <C-W>m :<C-U>vnew<CR>:Fern .<CR>
  nnoremap <silent> <C-W><Tab> :tabnew<CR>:Fern .<CR>
  xnoremap <silent> <C-W><Tab> :<C-U>tabnew<CR>:Fern .<CR>
endfunction

augroup init#fern
  autocmd!
  " source ftplugin secondly to ensure $XDG_CONFIG_HOME/nvim is in runtimepath
  autocmd VimEnter fern://* set filetype=fern
augroup END
