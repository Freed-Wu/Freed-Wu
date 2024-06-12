" Vim indent file
" Language:             {{ expand('%:t:r') }}
" Maintainer:           {{ g:snips_author }} <{{ g:snips_email }}>
" Upstream:             {{ g:snips_github }}/{{ expand('%:p:h:h:t') }}
" Latest Revision:      {{ strftime('%F') }}

if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

let b:undo_indent = "setl <"

{% here %}
