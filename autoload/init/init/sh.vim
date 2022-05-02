function! init#init#sh#map() abort
  nnoremap <silent><buffer> [[ ?^\w\+(\s*)\s*{?<CR>
  nnoremap <silent><buffer> ]] /^\s*}$<CR>
endfunction
