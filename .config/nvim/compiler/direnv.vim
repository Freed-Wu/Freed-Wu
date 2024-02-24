if exists('b:current_compiler')
  finish
endif
let b:current_compiler = 'direnv'

let s:save_cpoptions = &cpoptions
set cpoptions&vim

CompilerSet makeprg=direnv\ allow\ %

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
