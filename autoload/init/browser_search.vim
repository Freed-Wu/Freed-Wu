function! init#browser_search#source() abort
  let g:browser_search_default_engine = 'github'
  nmap g/ <Plug>SearchNormal
  xmap g/ <Plug>SearchVisual
endfunction
