function! init#glyph_palette#post_source() abort
  augroup init#glyph_palette
    autocmd!
    autocmd VimEnter * call glyph_palette#apply()
  augroup END
endfunction
