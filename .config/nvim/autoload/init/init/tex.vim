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

  call vimtex#imaps#add_map({
        \ 'lhs' : 'r',
        \ 'rhs' : 'vimtex#imaps#style_math("mathrm")',
        \ 'expr' : 1,
        \ 'leader' : '#',
        \ 'wrapper' : 'vimtex#imaps#wrap_math'
        \})

  call vimtex#imaps#add_map({
        \ 'lhs' : 's',
        \ 'rhs' : 'vimtex#imaps#style_math("mathsf")',
        \ 'expr' : 1,
        \ 'leader' : '#',
        \ 'wrapper' : 'vimtex#imaps#wrap_math'
        \})
endfunction
