if exists('g:loaded_{{ expand('%:t:r') }}') || &cpoptions
  finish
endif

let s:save_cpoptions = &cpoptions
set cpoptions&vim

""
" Configure if load @plugin(name).
call g:{{ expand('%:t:r') }}#utils#plugin.Flag('g:loaded_{{ expand('%:t:r') }}', 1)

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
