""
" emmet.vim use hasmapto() to check if <C-Y> has been mapped,
" it will create no maps
function! init#emmet_vim#post_source() abort
  nnoremap <silent> <C-Y> :WhichKey '<lt>C-Y>'<CR>
  xnoremap <silent> <C-Y> :WhichKeyVisual '<lt>C-Y>'<CR>
endfunction
