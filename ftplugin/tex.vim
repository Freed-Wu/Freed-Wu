if getcwd() !=# expand('%:p:h')
  setlocal foldlevel=1
endif
let &l:path = '.,' . substitute(join(map(['TEXMFHOME', 'TEXMFLOCAL', 'TEXMFMAIN'],
      \ {_, v -> trim(system('kpsewhich -var-value=' . v))}), ':'),
      \ ':', '/tex/latex/**2,', 'g')
" Don't let g:vimtex_fold_enabled = 1 because pandoc need vimtex, too
setlocal foldmethod=expr
setlocal foldexpr=vimtex#fold#level(v:lnum)
setlocal foldtext=vimtex#fold#text()
setlocal spell

let b:browser_search_default_engine = 'google'

call init#init#tex#main()
