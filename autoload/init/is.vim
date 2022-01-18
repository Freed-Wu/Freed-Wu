function! init#is#source() abort
  let g:is#do_default_mappings = 0
  " a bug of anzu
  if has('win32unix')
    nmap n <Plug>(is-n)
    nmap N <Plug>(is-N)

    nmap * <Plug>(is-*)
    nmap # <Plug>(is-#)
    nmap g* <Plug>(is-g*)
    nmap g# <Plug>(is-g#)
    xmap * <Plug>(is-*)
    xmap # <Plug>(is-#)
    xmap g* <Plug>(is-g*)
    xmap g# <Plug>(is-g#)
  else
    nmap n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)<Plug>(anzu-sign-matchline)
    nmap N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)<Plug>(anzu-sign-matchline)

    nmap * <Plug>(is-nohl)<Plug>(asterisk-*)<Plug>(anzu-update-search-status-with-echo)<Plug>(anzu-sign-matchline)
    nmap # <Plug>(is-nohl)<Plug>(asterisk-#)<Plug>(anzu-update-search-status-with-echo)<Plug>(anzu-sign-matchline)
    nmap g* <Plug>(is-nohl)<Plug>(asterisk-g*)<Plug>(anzu-update-search-status-with-echo)<Plug>(anzu-sign-matchline)
    nmap g# <Plug>(is-nohl)<Plug>(asterisk-g#)<Plug>(anzu-update-search-status-with-echo)<Plug>(anzu-sign-matchline)
    xmap * <Plug>(is-nohl)<Plug>(asterisk-*)<Plug>(anzu-update-search-status-with-echo)<Plug>(anzu-sign-matchline)
    xmap # <Plug>(is-nohl)<Plug>(asterisk-#)<Plug>(anzu-update-search-status-with-echo)<Plug>(anzu-sign-matchline)
    xmap g* <Plug>(is-nohl)<Plug>(asterisk-g*)<Plug>(anzu-update-search-status-with-echo)<Plug>(anzu-sign-matchline)
    xmap g# <Plug>(is-nohl)<Plug>(asterisk-g#)<Plug>(anzu-update-search-status-with-echo)<Plug>(anzu-sign-matchline)
  endif
endfunction
