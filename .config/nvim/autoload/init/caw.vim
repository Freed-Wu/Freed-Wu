function! init#caw#source() abort
  let g:caw_dollarpos_sp_left = '  '
  nmap gss  <Plug>(caw:hatpos:toggle:operator)
  nmap gsi  <Plug>(caw:hatpos:comment:operator)
  nmap gsui <Plug>(caw:hatpos:uncomment:operator)
  nmap gsI  <Plug>(caw:zeropos:comment:operator)
  nmap gsuI <Plug>(caw:zeropos:uncomment:operator)
  nmap gsa  <Plug>(caw:dollarpos:comment:operator)
  nmap gsua <Plug>(caw:dollarpos:uncomment:operator)
  nmap gsw  <Plug>(caw:wrap:comment:operator)
  nmap gsuw <Plug>(caw:wrap:uncomment:operator)
  nmap gsb  <Plug>(caw:box:comment:operator)
endfunction
