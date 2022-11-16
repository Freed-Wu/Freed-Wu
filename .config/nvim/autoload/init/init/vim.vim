""
" assets/json/context/normal/vim.json
"
" assets/json/context/visual/vim.json
function! init#init#vim#map() abort
  nnoremap <silent><nowait><buffer> <LocalLeader> :call init#init#quickui#install('normal/vim')<CR>
  xnoremap <silent><nowait><buffer> <LocalLeader> :<C-U>call init#init#quickui#install('visual/vim')<CR>
endfunction

function! init#init#vim#set(...) abort
  let l:word = init#parse(a:)
  let l:word = substitute(l:word, "'", '', 'g')
  execute 'set' l:word . '?'
endfunction

function! init#init#vim#echo(...) abort
  let l:word = init#parse(a:)
  let l:word = substitute(l:word, '[|`]', '', 'g')
  let l:word = substitute(l:word, '[lsa]\ze:', 'g', 'g')
  echo eval(l:word)
endfunction

function! init#init#vim#has(...) abort
  let l:word = init#parse(a:)
  echo has(l:word)
endfunction

function! init#init#vim#autocmd(...) abort
  let l:word = init#parse(a:)
  let l:word = substitute(l:word, '[|`]', '', 'g')
  execute 'autocmd' l:word
endfunction

function! init#init#vim#highlight(...) abort
  let l:word = init#parse(a:)
  execute 'highlight' l:word
endfunction

function! init#init#vim#map_(...) abort
  let l:word = init#parse(a:)
  execute 'map' l:word
endfunction

function! init#init#vim#function(...) abort
  let l:word = init#parse(a:)
  let l:word = substitute(l:word, '[|`]\|(.*)', '', 'g')
  execute 'function' l:word
endfunction

function! init#init#vim#execute(...) abort
  let l:line = init#parse(a:)
  let l:line = substitute(l:line, '[|`]\|(.*)', '', 'g')
  let l:line = substitute(l:line, '[lsa]\ze:', 'g', 'g')
  execute l:line
endfunction
