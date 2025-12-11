setlocal commentstring=//\ %s
setlocal keywordprg=:help

nnoremap <silent><buffer> [[ ?^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\%(:\_s*[^{]\+\)\{0,1}\_s*{<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ]] /^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\%(:\_s*[^{]\+\)\{0,1}\_s*{<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> [] ?^\s*}$<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ][ /^\s*}$<CR>:let @/ = ''<CR>
xnoremap <silent><buffer> [[ ?^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\%(:\_s*[^{]\+\)\{0,1}\_s*{<CR>
xnoremap <silent><buffer> ]] /^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\%(:\_s*[^{]\+\)\{0,1}\_s*{<CR>
xnoremap <silent><buffer> [] ?^\s*}$<CR>
xnoremap <silent><buffer> ][ /^\s*}$<CR>
onoremap <silent><buffer> [[ ?^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\%(:\_s*[^{]\+\)\{0,1}\_s*{<CR>
onoremap <silent><buffer> ]] /^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\%(:\_s*[^{]\+\)\{0,1}\_s*{<CR>
onoremap <silent><buffer> [] ?^\s*}$<CR>
onoremap <silent><buffer> ][ /^\s*}$<CR>
