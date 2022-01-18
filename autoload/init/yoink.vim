function! init#yoink#source() abort
  if has('nvim')
    let g:yoinkSavePersistently = 1
  endif
  let g:yoinkMaxItems = 100
  let g:yoinkSyncNumberedRegisters = 1
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
