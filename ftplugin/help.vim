setlocal iskeyword=!-~,^*,^\|,^\"
setlocal tabstop=8
setlocal shiftwidth=8
setlocal noexpandtab
setlocal nonumber
setlocal norelativenumber
setlocal nowrap
setlocal concealcursor=

call textobj#user#map('help', {
      \ 'link': {
        \ 'move-p': '<buffer>[m',
        \ 'move-n': '<buffer>]m',
        \ 'move-P': '<buffer>[M',
        \ 'move-N': '<buffer>]M',
        \ },
        \ 'option': {
          \ 'move-p': "<buffer>['",
          \ 'move-n': "<buffer>]'",
          \ 'move-P': '<buffer>["',
          \ 'move-N': '<buffer>]"',
          \ },
          \ 'any': {
            \ 'move-p': '<buffer>[[',
            \ 'move-n': '<buffer>]]',
            \ 'move-P': '<buffer>[]',
            \ 'move-N': '<buffer>][',
            \ },
            \ })
call init#init#vim#map()

if exists('##CmdlineEnter')
  augroup init_help
    autocmd!
    autocmd CmdlineEnter <buffer> call init#init#help#set()
    autocmd CmdlineLeave <buffer> call init#init#help#unset()
  augroup END
endif
