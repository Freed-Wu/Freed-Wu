function! init#init#dosini#main() abort
  nnoremap <silent><buffer> [[ ?^[<CR>:let @/=''<CR>
  nnoremap <silent><buffer> ]] /^[<CR>:let @/=''<CR>
  nnoremap <silent><buffer> [] ?^[<CR>}:let @/=''<CR>
  nnoremap <silent><buffer> ][ /^[<CR>{:let @/=''<CR>
endfunction
