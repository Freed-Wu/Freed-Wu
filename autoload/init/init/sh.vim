function! init#init#sh#map() abort
  nnoremap <silent><buffer> [[ ?^\s*\w\+(\s*)\_s*{<CR>:let @/ = ''<CR>
  nnoremap <silent><buffer> ]] /^\s*\w\+(\s*)\_s*{<CR>:let @/ = ''<CR>
  nnoremap <silent><buffer> [] ?^\s*}$<CR>:let @/ = ''<CR>
  nnoremap <silent><buffer> ][ /^\s*}$<CR>:let @/ = ''<CR>
  xnoremap <silent><buffer> [[ ?^\s*\w\+(\s*)\_s*{<CR>
  xnoremap <silent><buffer> ]] /^\s*\w\+(\s*)\_s*{<CR>
  xnoremap <silent><buffer> [] ?^\s*}$<CR>
  xnoremap <silent><buffer> ][ /^\s*}$<CR>
  onoremap <silent><buffer> [[ ?^\s*\w\+(\s*)\_s*{<CR>
  onoremap <silent><buffer> ]] /^\s*\w\+(\s*)\_s*{<CR>
  onoremap <silent><buffer> [] ?^\s*}$<CR>
  onoremap <silent><buffer> ][ /^\s*}$<CR>
endfunction
