function! init#express#source() abort
  let g:express_no_mappings = 1
  nmap g! <Plug>(Express)
  xmap g! <Plug>(Express)
  nmap g!! <Plug>(ExpressLine)
  nmap g: <Plug>(Subpress)
  xmap g: <Plug>(Subpress)
  nmap <silent> g:: <Plug>(SubpressLine)
endfunction
