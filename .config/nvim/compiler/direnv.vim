if exists('b:current_compiler')
  finish
endif
let b:current_compiler = 'direnv'

let s:save_cpoptions = &cpoptions
set cpoptions&vim

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif
CompilerSet makeprg=direnv\ allow\ %

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
