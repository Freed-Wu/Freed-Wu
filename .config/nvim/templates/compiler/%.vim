if exists('b:current_compiler')
  finish
endif
let b:current_compiler = '{{ expand('%:t:r') }}'

let s:save_cpoptions = &cpoptions
set cpoptions&vim

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif
CompilerSet makeprg={{ expand('%:t:r') }}\ %:S
CompilerSet errorformat=%E%.%#,{% here %}
      \%Z

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
