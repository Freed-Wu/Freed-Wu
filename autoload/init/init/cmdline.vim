function! init#init#cmdline#main() abort
  cnoremap <silent> <C-K> <C-F>i<C-O>:set virtualedit +=onemore<CR><C-O>d$<C-O>:set virtualedit -=onemore<CR><C-C>
  cnoremap <C-X><C-Z> <C-K>
  cnoremap <C-X><C-Y> <C-Y>
endfunction
