scriptencoding utf-8
function! init#indentline#source() abort
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  let g:indentLine_fileTypeExclude = ['calendar', 'which_key', 'syntax_test']
  let g:indentLine_bufTypeExclude = ['terminal']
  let g:indentLine_faster = 1
  let g:indentLine_concealcursor = ''
  let g:indentLine_color_term = 'blue'
  let g:indentLine_color_gui = 'blue'
endfunction

augroup init#indentline
  autocmd!
  autocmd OptionSet tabstop,shiftwidth,expandtab IndentLinesReset
augroup END
