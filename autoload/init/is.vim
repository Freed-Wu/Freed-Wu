function! init#is#source() abort
  let g:is#do_default_mappings = 0
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
endfunction
