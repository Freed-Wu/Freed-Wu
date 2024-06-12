function! init#exchange#source() abort
  let g:exchange_no_mappings = 1
  let g:exchange_indent = 1
  nmap - <Plug>(Exchange)
  nmap -- <Plug>(ExchangeClear)
  xmap - <Plug>(Exchange)
endfunction
