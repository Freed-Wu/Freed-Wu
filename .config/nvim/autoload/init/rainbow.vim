function! init#rainbow#source() abort
  let g:rainbow_active = 1
  " https://github.com/Freed-Wu/conceal.vim
  " https://github.com/luochen1990/rainbow/issues/186
  let g:rainbow_conf = {
        \ 'separately': {
          \ 'bbcode': 0,
          \ 'html': 0,
          \ 'htmldjango': 0,
          \ 'jinja2': 0,
          \ 'liquid': 0,
          \ 'systemd': 0,
          \ },
          \ }
endfunction
