runtime! ftplugin/asm.vim

nnoremap <silent><buffer> [m ?^\s*[\?section\s<CR>:let @/=''<CR>
nnoremap <silent><buffer> ]m /^\s*[\?section\s<CR>:let @/=''<CR>
