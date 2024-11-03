setlocal tabstop=4
setlocal shiftwidth=4
setlocal keywordprg=:help

nnoremap <silent><nowait><buffer> <LocalLeader> :call init#init#quickui#install('assets/json/context/normal/lua.json')<CR>
xnoremap <silent><nowait><buffer> <LocalLeader> :<C-U>call init#init#quickui#install('assets/json/context/visual/lua.json')<CR>

let b:browser_search_default_engine = 'luarocks'
