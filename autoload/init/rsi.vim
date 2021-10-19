function! init#rsi#post_source() abort
  " override rsi.vim
  inoremap <silent><expr> <M-n> "\<C-R>=coc#float#scroll(1)\<cr>"
  inoremap <silent><expr> <M-p> "\<C-R>=coc#float#scroll(0)\<cr>"
endfunction
