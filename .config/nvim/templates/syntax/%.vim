if exists('b:current_syntax')
  finish
endif
let b:current_syntax = '{{ expand('%:t:r') }}'

syntax case match

syntax match {{ expand('%:t:r') }}

highlight default link {% here %}
