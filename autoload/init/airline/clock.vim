function! init#airline#clock#source() abort
  call airline#add_statusline_func('airline#extensions#clock#apply')
endfunction
