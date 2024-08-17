scriptencoding utf-8
function! init#fern#source() abort
  let g:fern#renderer = 'nerdfont'
  let g:fern#mark_symbol = '✓'
  let g:fern#disable_default_mappings = 1
  if g:fern#drawer_width > &columns / 4
    let g:fern#drawer_width = &columns / 4
  endif
  nnoremap <silent> <C-W>N <C-W>n:Fern .<CR>
  nnoremap <silent> <C-W>M :vnew<CR>:Fern .<CR>
  xnoremap <silent> <C-W>N <C-W>n:Fern .<CR>
  xnoremap <silent> <C-W>M :<C-U>vnew<CR>:Fern .<CR>
  nnoremap <silent> <C-W><S-Tab> :tabnew<CR>:Fern .<CR>
  xnoremap <silent> <C-W><S-Tab> :<C-U>tabnew<CR>:Fern .<CR>
endfunction

augroup init#fern
  autocmd!
  " source ftplugin secondly to ensure $XDG_CONFIG_NVIM is in runtimepath
  autocmd VimEnter fern://* set filetype=fern
augroup END
