setlocal norelativenumber
setlocal previewwindow

wincmd J

nnoremap <buffer> <CR> <CR>
nnoremap <silent><buffer> [[ ?\<error\><CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ]] /\<error\><CR>:let @/ = ''<CR>
nnoremap <silent><buffer> [] ?\<error\><CR>k:let @/ = ''<CR>
nnoremap <silent><buffer> [] /\<error\><CR>j:let @/ = ''<CR>
