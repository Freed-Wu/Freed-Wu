if exists('b:current_compiler')
  finish
endif
let b:current_compiler = 'sphinx'

let s:save_cpoptions = &cpoptions
set cpoptions&vim

CompilerSet makeprg=sphinx-build\ docs\ docs/_build/html

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
