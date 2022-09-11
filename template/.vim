""
" @section Introduction, intro
" @library
" <doc/@plugin(name).txt> is generated by <https://github.com/google/vimdoc>.

""
" @section Configuration, config

if exists('g:loaded_%FILE%') || &cpoptions
  finish
endif

let s:save_cpoptions = &cpoptions
set cpoptions&vim

function! s:Flag(name, default) abort
  let l:scope = get(split(a:name, ':'), 0, 'g:')
  let l:name = get(split(a:name, ':'), -1)
  let g:{name} = get({l:scope}:, l:name, a:default)
endfunction

let s:plugin = {'Flag': funcref('s:Flag')}

""
" configure if load @plugin(name)
call s:plugin.Flag('g:loaded_%FILE%', 1)

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
