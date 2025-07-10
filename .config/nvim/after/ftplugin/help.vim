setlocal iskeyword=!-~,^*,^\|,^\"
setlocal nonumber
setlocal norelativenumber
setlocal nowrap
setlocal concealcursor=
setlocal keywordprg=:help

call init#textobj#map('help')
call init#init#vim#map()
