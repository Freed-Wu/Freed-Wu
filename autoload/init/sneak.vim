function! init#sneak#source() abort
  let g:sneak#s_next = 1
  let g:sneak#map_netrw = 0
  nmap f <Plug>Sneak_f
  xmap f <Plug>Sneak_f
  omap f <Plug>Sneak_f
  nmap F <Plug>Sneak_F
  xmap F <Plug>Sneak_F
  omap F <Plug>Sneak_F
  nmap t <Plug>Sneak_t
  xmap t <Plug>Sneak_t
  omap t <Plug>Sneak_t
  nmap T <Plug>Sneak_T
  xmap T <Plug>Sneak_T
  omap T <Plug>Sneak_T
endfunction
