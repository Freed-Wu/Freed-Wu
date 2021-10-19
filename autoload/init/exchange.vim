function! init#exchange#source() abort
  let g:exchange_no_mappings = 1
  let g:exchange_indent = 1
  nmap Q <Plug>(Exchange)
  nmap QQ <Plug>(ExchangeClear)
  xmap Q <Plug>(Exchange)
endfunction
