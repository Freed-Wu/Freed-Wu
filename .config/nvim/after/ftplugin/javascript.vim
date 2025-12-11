setlocal keywordprg=:help

let b:browser_search_default_engine = 'npm'

nnoremap <silent><buffer> [[ ?^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\_s*{<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ]] /^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\_s*{<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> [] ?^\s*}$<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ][ /^\s*}$<CR>:let @/ = ''<CR>
xnoremap <silent><buffer> [[ ?^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\_s*{<CR>
xnoremap <silent><buffer> ]] /^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\_s*{<CR>
xnoremap <silent><buffer> [] ?^\s*}$<CR>
xnoremap <silent><buffer> ][ /^\s*}$<CR>
onoremap <silent><buffer> [[ ?^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\_s*{<CR>
onoremap <silent><buffer> ]] /^\s*\%(export\s\+\)\{0,1}\%(async\s\+\)\{0,1}function\s\+[-_a-zA-Z0-9]\+\s*([^)]*)\_s*{<CR>
onoremap <silent><buffer> [] ?^\s*}$<CR>
onoremap <silent><buffer> ][ /^\s*}$<CR>
