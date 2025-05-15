setlocal commentstring=#\ %s

nnoremap <silent><buffer> [m ?^\s*\.u\{,1\}sect\(ion\)\{,1\}\s<CR>:let @/=''<CR>
nnoremap <silent><buffer> ]m /^\s*\.u\?sect\(ion\)\?\s<CR>:let @/=''<CR>
nnoremap <silent><buffer> [[ ?^\s*%macro\s<CR>:let @/=''<CR>
nnoremap <silent><buffer> ]] /^\s*%endmacro<CR>:let @/=''<CR>
nnoremap <silent><buffer> [] ?^\s*%endmacro<CR>:let @/=''<CR>
nnoremap <silent><buffer> ][ /^\s*%macro\s<CR>:let @/=''<CR>
