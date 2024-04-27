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
  nmap [k <Plug>(YoinkRotateBack)
  nmap ]k <Plug>(YoinkRotateForward)
  nnoremap <silent> [K :<C-U>Yanks<CR>
  nnoremap <silent> ]K :<C-U>ClearYanks<CR>
  nmap y <Plug>(YoinkYankPreserveCursorPosition)
  xmap y <Plug>(YoinkYankPreserveCursorPosition)
endfunction
