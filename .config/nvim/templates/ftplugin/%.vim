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
