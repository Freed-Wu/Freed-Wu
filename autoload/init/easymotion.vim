function! init#easymotion#source() abort
  nmap <M-BS> <Plug>(easymotion-prefix)
  xmap <M-BS> <Plug>(easymotion-prefix)
  omap <M-BS> <Plug>(easymotion-prefix)
  nmap <M-BS>; <Plug>(easymotion-next)
  nmap <M-BS>, <Plug>(easymotion-prev)
endfunction
