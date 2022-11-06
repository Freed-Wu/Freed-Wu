setlocal iskeyword=!-~,^*,^\|,^\"
setlocal nonumber
setlocal norelativenumber
setlocal nowrap
setlocal concealcursor=

call init#textobj#map('help')
call init#init#vim#map()

if exists('##CmdlineEnter')
  augroup init_help
    autocmd!
    autocmd CmdlineEnter <buffer> call init#init#help#set()
    autocmd CmdlineLeave <buffer> call init#init#help#unset()
  augroup END
endif
