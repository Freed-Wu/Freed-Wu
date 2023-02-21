if exists('g:loaded_%FILE%') || &cpoptions
  finish
endif

let s:save_cpoptions = &cpoptions
set cpoptions&vim

""
" Configure if load @plugin(name).
call g:%FILE%#utils#plugin.Flag('g:loaded_%FILE%', 1)

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
