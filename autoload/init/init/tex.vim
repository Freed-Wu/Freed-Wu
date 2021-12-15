function! init#init#tex#main() abort
  nmap <buffer> crf <Plug>(vimtex-cmd-toggle-frac)
  xmap <buffer> Sf <Plug>(vimtex-cmd-toggle-frac)
  nmap <buffer> crk <Plug>(vimtex-delim-toggle-modifier)
  xmap <buffer> Sk <Plug>(vimtex-delim-toggle-modifier)
  nmap <buffer> crj <Plug>(vimtex-delim-toggle-modifier-reverse)
  xmap <buffer> Sj <Plug>(vimtex-delim-toggle-modifier-reverse)
  nmap <buffer> cre <Plug>(vimtex-env-toggle-star)
  xmap <buffer> Se <Plug>(vimtex-env-toggle-star)
  nmap <buffer> crc <Plug>(vimtex-cmd-toggle-star)
  xmap <buffer> Sc <Plug>(vimtex-cmd-toggle-star)

  nmap <buffer> crr <Plug>(vimtex-cmd-create)
  xmap <buffer> SS <Plug>(vimtex-cmd-create)

  nmap <buffer> gK <Plug>(vimtex-doc-package)
endfunction
