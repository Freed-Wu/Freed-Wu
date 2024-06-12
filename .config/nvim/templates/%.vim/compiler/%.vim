" Vim Compiler File
" Language:             {{ expand('%:t:r') }}
" Maintainer:           {{ g:snips_author }} <{{ g:snips_email }}>
" Upstream:             {{ g:snips_github }}/{{ expand('%:p:h:h:t') }}
" Latest Revision:      {{ strftime('%F') }}

if exists('b:current_compiler')
  finish
endif
let b:current_compiler = '{{ expand('%:t:r') }}'

let s:save_cpoptions = &cpoptions
set cpoptions&vim

CompilerSet makeprg={{ expand('%:t:r') }}\ %:S
CompilerSet errorformat=%E%.%#,{% here %}
      \%Z

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
