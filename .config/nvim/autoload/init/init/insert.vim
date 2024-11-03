function! init#init#insert#main() abort
  inoremap <C-F> <Right>
  inoremap <C-J> <C-E>
  inoremap <C-L> <C-Y>
  " readline
  inoremap <silent> <M-.> <C-R>=split(getline(line('.') - 1))[-1]<CR>
  inoremap <M-c> <C-O>~<C-O>gue<S-Right>
  inoremap <silent> <C-K> <C-O>:set virtualedit +=onemore<CR><C-O>d$<C-O>:set virtualedit -=onemore<CR>
  inoremap <C-_> <C-O>u
  inoremap <M-a> <C-O>(
  inoremap <M-e> <C-O>)
  inoremap <silent> <M-m> <C-R>=split(getline(line('.')))[-1]<CR>
  inoremap <M-x> <C-O>:
  inoremap <M-s> <C-G>u<Esc>[s1z=`]a<C-G>u
  inoremap <M-Bar> <C-O><Bar>
  inoremap <M-<> <C-O>gg
  inoremap <M->> <C-O>G
endfunction
