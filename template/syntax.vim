if exists('b:current_syntax')
  finish
endif
let b:current_syntax = '%FILE%'

syntax case match

syntax match %FILE%

highlight default link %HERE%
