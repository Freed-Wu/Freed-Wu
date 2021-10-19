function! init#init#post_source() abort
  augroup init#init
    autocmd!
    if has('nvim-0.5.0') || has('patch-8.1.1564')
      autocmd InsertEnter * ++once call init#init#insert#main()
      autocmd CmdlineEnter * ++once call init#init#cmdline#main()
    else
      autocmd VimEnter * call init#init#insert#main()
      autocmd VimEnter * call init#init#cmdline#main()
    endif
  augroup END
endfunction
