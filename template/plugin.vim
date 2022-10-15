if exists('g:loaded_%FILE%') || &cpoptions
  finish
endif

let s:save_cpoptions = &cpoptions
set cpoptions&vim

let s:plugin = {'Flag': funcref('g:%FILE%#utils#flag')}

""
" configure if load @plugin(name)
call s:plugin.Flag('g:loaded_%FILE%', 1)

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
