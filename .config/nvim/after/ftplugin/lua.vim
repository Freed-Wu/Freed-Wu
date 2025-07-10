setlocal tabstop=4
setlocal shiftwidth=4
setlocal keywordprg=:help

nnoremap <silent><nowait><buffer> <LocalLeader> :call init#init#quickui#install('assets/json/context/normal/lua.json')<CR>
xnoremap <silent><nowait><buffer> <LocalLeader> :<C-U>call init#init#quickui#install('assets/json/context/visual/lua.json')<CR>
nnoremap <silent><buffer> [[ ?^\s*\%(local\s\+\)\{0,1}function<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ]] /^\s*\%(local\s\+\)\{0,1}function<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> [] ?^\s*endfunction$<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ][ /^\s*endfunction$<CR>:let @/ = ''<CR>
xnoremap <silent><buffer> [[ ?^\s*\%(local\s\+\)\{0,1}function<CR>
xnoremap <silent><buffer> ]] /^\s*\%(local\s\+\)\{0,1}function<CR>
xnoremap <silent><buffer> [] ?^\s*endfunction$<CR>
xnoremap <silent><buffer> ][ /^\s*endfunction$<CR>
onoremap <silent><buffer> [[ ?^\s*\%(local\s\+\)\{0,1}function<CR>
onoremap <silent><buffer> ]] /^\s*\%(local\s\+\)\{0,1}function<CR>
onoremap <silent><buffer> [] ?^\s*endfunction$<CR>
onoremap <silent><buffer> ][ /^\s*endfunction$<CR>

let b:browser_search_default_engine = 'luarocks'
