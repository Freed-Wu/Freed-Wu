" Vim filetype plugin file
" Language:             {{ expand('%:t:r') }}
" Maintainer:           {{ g:snips_author }} <{{ g:snips_email }}>
" Upstream:             {{ g:snips_github }}/{{ expand('%:p:h:h:t') }}
" Latest Revision:      {{ strftime('%F') }}

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = 'setl <'
{% here %}

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
