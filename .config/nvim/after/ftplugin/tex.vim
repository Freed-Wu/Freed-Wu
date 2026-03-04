if getcwd() !=# expand('%:p:h')
  setlocal foldlevel=1
endif
if executable('kpsepath')
  let &l:path = trim(substitute(substitute(substitute(system('kpsepath tex'),
        \ '!!', '', 'g'), '//\+', '/**/', 'g'), ':', ',', 'g'))
endif
" Don't let g:vimtex_fold_enabled = 1 because pandoc need vimtex, too
setlocal foldmethod=expr
setlocal foldexpr=vimtex#fold#level(v:lnum)
setlocal foldtext=vimtex#fold#text()
setlocal iskeyword-=:
setlocal spell

let b:browser_search_default_engine = 'ctan'
if expand('%:e') ==# 'dtx'
  let b:match_words = '%<\*driver>:%<\/driver>,%<\*cls>:%<\/cls>,%<\*sty>:%<\/sty>,%<\*cls|sty>:%<\/cls|sty>'
endif

call init#init#tex#main()
