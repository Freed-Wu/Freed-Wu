function! init#textobj#sentence#post_source() abort
  augroup init#textobj#sentence
    autocmd!
    autocmd VimEnter * call textobj#sentence#init()
  augroup END
endfunction
