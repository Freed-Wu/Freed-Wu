function! init#zoomwintab#source() abort
  let g:zoomwintab_remap = 0
  nnoremap <silent> <C-W>! :<C-U>ZoomWinTabToggle<CR>
endfunction
