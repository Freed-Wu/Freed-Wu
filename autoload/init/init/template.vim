""
" for LaTeX package script
" foo/build.lua -> foo
" for pre-commit hook config
" foo/.pre-commit_hooks.yaml -> foo
" for README.md
" foo/README.md -> foo
function! init#init#template#dir() abort
  return expand('%:p:h:t')
endfunction

""
" for homebrew package script:
" foo-bar -> FooBar
" foo-bar.rb -> class FooBar < Formula
function! init#init#template#cfile() abort
  return substitute(expand('%:t:r'), '\%(-\|^\)\(.\)', '\u\1', 'g')
endfunction

""
" for zsh completion script:
" _foo -> foo
function! init#init#template#file_() abort
  return substitute(expand('%:t'), '^_', '', 'g')
endfunction

""
" for pytest python script:
" foo_test.py -> foo
function! init#init#template#test_file() abort
  return substitute(expand('%:t'), '_test\.py$', '', 'g')
endfunction

""
" for neomutt config:
" neomutt.foo -> foo
function! init#init#template#ext() abort
  return expand('%:e')
endfunction

function! init#init#template#github() abort
  return g:snips_github
endfunction

function! init#init#template#github_user() abort
  return $GITHUB_USER
endfunction