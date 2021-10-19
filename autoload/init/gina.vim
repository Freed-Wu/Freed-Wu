function! init#gina#source() abort
  let g:gina#action#mark_sign_text = '✓'
  let g:gina#command#blame#formatter#current_mark = '✓'
endfunction

function! init#gina#post_source() abort
  call gina#custom#mapping#nmap(
        \ '/.*', 'J',
        \ '<Plug>(gina-builtin-mark)j'
        \)
  call gina#custom#mapping#nmap(
        \ '/.*', 'K',
        \ 'k<Plug>(gina-builtin-mark)'
        \)
  call gina#custom#mapping#nmap(
        \ '/.*', '<C-J>',
        \ '<C-W>j'
        \)
  call gina#custom#mapping#nmap(
        \ '/.*', '<C-K>',
        \ '<C-W>k'
        \)
  call gina#custom#mapping#nmap(
        \ 'blame', 'R',
        \ '<Plug>(gina-blame-C-L)'
        \)
  call gina#custom#mapping#nmap(
        \ 'blame', '<C-L>',
        \ '<C-W>l'
        \)
endfunction

augroup init#fugitive
  autocmd!
  autocmd BufEnter * Gina lcd
augroup END
