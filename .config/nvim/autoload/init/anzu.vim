function! init#anzu#post_source() abort
  augroup init#anzu
    autocmd!
    autocmd CursorMoved * AnzuClearSignMatchLine
  augroup END
endfunction
