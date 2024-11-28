setlocal iskeyword=!-~,^*,^\|,^\"
setlocal nonumber
setlocal norelativenumber
setlocal nowrap
setlocal concealcursor=
setlocal keywordprg=:help

call init#textobj#map('help')
call init#init#vim#map()

if exists(':Helpview') && get(b:, 'helpview', 0) == 0
  Helpview enable
  let b:helpview = 1
endif
