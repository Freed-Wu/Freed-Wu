function! init#chalk#source()  abort
  let g:chalk_align = 0
  nmap z> <Plug>ChalkUp
  nmap z< <Plug>ChalkDown
  xmap z> <Plug>ChalkUp
  xmap z< <Plug>ChalkDown
  nmap zf <Plug>Chalk
  xmap zf <Plug>Chalk
  nmap zF <Plug>ChalkRange
endfunction
