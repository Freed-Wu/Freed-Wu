""
" @section Configuration, config

function! s:Flag(name, default) abort
  let l:scope = get(split(a:name, ':'), 0, 'g:')
  let l:name = get(split(a:name, ':'), -1)
  let {l:scope}:{l:name} = get({l:scope}:, l:name, a:default)
endfunction

let g:{{ expand('%:p:h:t') }}#utils#plugin = {'Flag': funcref('s:Flag')}
