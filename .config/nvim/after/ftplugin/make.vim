setlocal noexpandtab
nnoremap <silent> <buffer> [[ :?^\S\+:<CR>:let @/ = ''<CR>
nnoremap <silent> <buffer> ]] :/^\S\+:<CR>:let @/ = ''<CR>
