if exists('b:current_compiler')
  finish
endif
let b:current_compiler = '%FILE%'

let s:save_cpoptions = &cpoptions
set cpoptions&vim

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif
CompilerSet makeprg=%FILE%\ %:S
CompilerSet errorformat=%E%.%#,%HERE%
      \%Z

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
