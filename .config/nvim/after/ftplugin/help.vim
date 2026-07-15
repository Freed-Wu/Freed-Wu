setlocal iskeyword=!-~,^*,^\|,^\"
setlocal nonumber
setlocal norelativenumber
setlocal nowrap
setlocal concealcursor=
setlocal keywordprg=:help

call init#init#vim#map()

nnoremap <buffer> gd <C-]>
