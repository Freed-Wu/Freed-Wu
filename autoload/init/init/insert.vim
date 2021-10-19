function! init#init#insert#main() abort
  inoremap <C-J> <C-E>
  inoremap <C-L> <C-Y>
  inoremap <expr><C-P> pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr><C-N> pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr><C-V> pumvisible() ? "\<PageDown>" : "\<C-V>"
  inoremap <expr><M-V> pumvisible() ? "\<PageUp>" : "\<M-V>"
  " readline
  inoremap <M-c> <C-O>~<C-O>gue<S-Right>
  inoremap <silent> <C-K> <C-O>:set virtualedit +=onemore<CR><C-O>d$<C-O>:set virtualedit -=onemore<CR>
  inoremap <C-_> <C-O>u
  inoremap <M-a> <C-O>(
  inoremap <M-e> <C-O>)
  inoremap <M-m> <C-O>^
  inoremap <M-x> <C-O>:
  inoremap <M-s> <C-G>u<Esc>[s1z=`]a<C-G>u
  inoremap <M-Bar> <C-O><Bar>
  inoremap <M-<> <C-O>gg
  inoremap <M->> <C-O>G
endfunction
