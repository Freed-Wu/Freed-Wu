#!/usr/bin/env -S nvim --headless -u
" https://github.com/neoclide/coc.nvim/issues/118#issuecomment-1311768351
source ~/.config/nvim/autoload/init/coc.vim
call init#coc#source()
call writefile(['{"dependencies": {}}'], expand('~/.config/coc/extensions/package.json'))
call mkdir(expand('~/.config/coc/extensions/coc-gist-data'), 'p')
call writefile(['{"token": "gho_"}'], expand('~/.config/coc/extensions/coc-gist-data/secret.json'))
echo join(g:coc_global_extensions, ' ')
quit
