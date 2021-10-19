function! init#committia#source() abort
  imap <buffer> <M-N> <Plug>(committia-scroll-diff-down-half)
  imap <buffer> <M-P> <Plug>(committia-scroll-diff-up-half)
endfunction
