function! init#incsearch#easymotion#source() abort
  nmap / <Plug>(incsearch-easymotion-stay)
  xmap / <Plug>(incsearch-easymotion-stay)
  omap / <Plug>(incsearch-easymotion-stay)
  nnoremap <expr> ? incsearch#go(init#init#fuzzymotion#main({'is_stay': 1}))
  xnoremap <expr> ? incsearch#go(init#init#fuzzymotion#main({'is_stay': 1}))
  onoremap <expr> ? incsearch#go(init#init#fuzzymotion#main({'is_stay': 1}))
endfunction
