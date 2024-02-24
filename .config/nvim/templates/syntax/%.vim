" Vim syntax file
" Language:             {{ expand('%:t:r') }}
" Maintainer:           {{ g:snips_author }} <{{ g:snips_email }}>
" Upstream:             {{ g:snips_github }}/{{ expand('%:p:h:h:t') }}
" Latest Revision:      {{ strftime('%F') }}

if exists('b:current_syntax')
  finish
endif
let b:current_syntax = '{{ expand('%:t:r') }}'

syntax case match

syntax match {{ expand('%:t:r') }}

highlight default link {% here %}
