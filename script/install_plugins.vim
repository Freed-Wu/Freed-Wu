#!/usr/bin/env -S nvim --headless -u
" https://github.com/neoclide/coc.nvim/issues/118#issuecomment-1311768351
let s:file = expand('~/.config/coc/extensions/coc-gist-data/secret.json')
call mkdir(fnamemodify(s:file, ':h'), 'p')
if !filereadable(s:file)
  call writefile(['{"token": "gho_"}'], s:file)
endif
let s:file = expand('~/.config/coc/extensions/package.json')
if !filereadable(s:file)
  call writefile(['{"dependencies": {}}'], s:file)
endif

source ~/.config/nvim/autoload/init/coc.vim
call init#coc#source()
echo join(g:coc_global_extensions, ' ')
quit
