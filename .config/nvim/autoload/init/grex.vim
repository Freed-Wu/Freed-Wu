function! init#grex#source() abort
  nmap gY <Plug>(operator-grex-delete)
  xmap gY <Plug>(operator-grex-delete)
  omap gY <Plug>(operator-grex-delete)
  nmap gy <Plug>(operator-grex-yank)
  xmap gy <Plug>(operator-grex-yank)
  omap gy <Plug>(operator-grex-yank)
endfunction
