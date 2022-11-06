function! init#surround#source() abort
  " https://github.com/tpope/vim-surround/issues/365
  " let g:surround_{char2nr('<')} = "< \r >"
  let g:surround_{char2nr('\')} = "<\r \\>"
  let g:surround_{char2nr('p')} = "<?php \r ?>"
  let g:surround_{char2nr('l')} = "\\begin{\1environment: \1}\r\\end{\1\1}"
  let g:surround_{char2nr('d')} = "<div\1id: \r..*\r id=\"&\"\1>\r</div>"
  let g:surround_indent = 1
  let g:surround_no_mappings = 1

  nmap ds <Plug>Dsurround
  nmap cs <Plug>Csurround
  nmap cS <Plug>CSurround
  nmap ys <Plug>Ysurround
  nmap yS <Plug>YSurround
  nmap yss <Plug>Yssurround
  nmap ySs <Plug>YSsurround
  nmap ySS <Plug>YSsurround
  xmap s <Plug>VSurround
  xmap S <Plug>VgSurround
  imap <C-S> <Plug>Isurround
  imap <C-G>s <Plug>Isurround
  imap <C-G>S <Plug>ISurround
endfunction
