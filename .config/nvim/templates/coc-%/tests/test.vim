#!/usr/bin/env -S vi -u
set runtimepath=$VIMRUNTIME
set runtimepath+=~/.local/share/nvim/repos/github.com/neoclide/coc.nvim_release
let s:root = fnamemodify(expand('<sfile>'), ':p:h:h')
execute 'set runtimepath+=' . s:root
let g:coc_config_home = '.'
let g:coc_data_home = s:root . '/node_modules/coc'
set formatexpr=CocAction('formatSelected')
