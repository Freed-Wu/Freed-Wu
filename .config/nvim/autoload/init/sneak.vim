function! init#sneak#source() abort
  let g:sneak#s_next = 1
  let g:sneak#map_netrw = 0
  nmap <silent> f <Plug>Sneak_f
  xmap <silent> f <Plug>Sneak_f
  omap <silent> f <Plug>Sneak_f
  nmap <silent> F <Plug>Sneak_F
  xmap <silent> F <Plug>Sneak_F
  omap <silent> F <Plug>Sneak_F
  nmap <silent> t <Plug>Sneak_t
  xmap <silent> t <Plug>Sneak_t
  omap <silent> t <Plug>Sneak_t
  nmap <silent> T <Plug>Sneak_T
  xmap <silent> T <Plug>Sneak_T
  omap <silent> T <Plug>Sneak_T
endfunction
