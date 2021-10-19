function! init#yoink#source() abort
  let g:yoinkMaxItems = 100
  let g:yoinkSyncNumberedRegisters = 1
  let g:yoinkSavePersistently = 1
  let g:yoinkAutoFormatPaste = 1
  let g:yoinkMoveCursorToEndOfPaste = 1
  let g:yoinkSwapClampAtEnds = 0
  nmap p <Plug>(YoinkPaste_p)
  nmap P <Plug>(YoinkPaste_P)
  nmap gp <Plug>(YoinkPaste_gp)
  nmap gP <Plug>(YoinkPaste_gP)
  nmap <C-P> <Plug>(YoinkPostPasteSwapBack)
  nmap <C-N> <Plug>(YoinkPostPasteSwapForward)
  nmap [r <Plug>(YoinkRotateBack)
  nmap ]r <Plug>(YoinkRotateForward)
  nnoremap <silent> [R :<C-U>Yanks<CR>
  nnoremap <silent> ]R :<C-U>ClearYanks<CR>
  nmap y <Plug>(YoinkYankPreserveCursorPosition)
  xmap y <Plug>(YoinkYankPreserveCursorPosition)
endfunction

" https://github.com/svermeulen/vim-yoink/issues/28
function! init#yoink#post_source() abort
  autocmd VimEnter * autocmd! _Yoink VimEnter
endfunction
