function! init#init#dein#main() abort
  nnoremap <silent><buffer> gd :<C-U>execute 'edit' glob(finddir(expand('<cfile>')) . '/doc/*.txt')<CR>
  nnoremap <silent><buffer> gD :<C-U>execute 'edit' glob(finddir(expand('<cfile>')) . '/README*')<CR>
  nnoremap <silent><buffer> <C-W>d :<C-U>execute 'split' glob(finddir(expand('<cfile>')) . '/doc/*.txt')<CR>
  nnoremap <silent><buffer> <C-W>D :<C-U>execute 'split' glob(finddir(expand('<cfile>')) . '/README*')<CR>
endfunction
