nnoremap <silent><buffer> <C-W>d $:sfind %:p:h/<cword>.snippets<CR>
nnoremap <silent><buffer> gd $:find %:p:h/<cword>.snippets<CR>
nnoremap <silent><buffer> [[ ?^\<snippet\><CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ]] /^\<snippet\><CR>:let @/ = ''<CR>
nnoremap <silent><buffer> [] ?^\<endsnippet\><CR>:let @/ = ''<CR>
nnoremap <silent><buffer> [] /^\<endsnippet\><CR>:let @/ = ''<CR>
