#!/usr/bin/env -S vi -u
" $ uname -r
" {{ trim(system('uname -r')) }}
" $ vi --version | head -n1
" {{ join(split(execute('version'))[0:1]) }}
" $ cat test.vim
set runtimepath=$VIMRUNTIME
set runtimepath+=~/.local/share/nvim/repos/github.com/{% here %}
let g:coc_config_home = '.'
let g:coc_data_home = '/dev/shm/coc'
" $ cat coc-settings.json
" $ chmod +x test.vim
" $ ./test.vim
