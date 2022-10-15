function! init#rainbow#source() abort
  let g:rainbow_active = 1
  " conflict with fontawesome-conceal.vim
  let g:rainbow_conf = {
        \ 'separately': {
          \ 'html': 0,
          \ },
          \ }
endfunction
