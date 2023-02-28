function! init#init#pod#map() abort
  nnoremap <silent><buffer> [[ ?^=<CR>:let @/=''<CR>
  nnoremap <silent><buffer> ]] /^=<CR>:let @/=''<CR>
  nnoremap <silent><buffer> [] ?^=<CR>:let @/=''<CR>
  nnoremap <silent><buffer> ][ /^=<CR>:let @/=''<CR>
endfunction
