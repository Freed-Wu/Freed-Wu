#!/usr/bin/env -S nvim --headless -u
" https://github.com/neoclide/coc.nvim/issues/118#issuecomment-1311768351
source ~/.config/nvim/autoload/init/init/install.vim
call mkdir(expand('~/.config/coc/extensions/coc-gist-data'), 'p')
call writefile(['{"dependencies": {}}'], expand('~/.config/coc/extensions/package.json'))
call writefile(['{"token": "gho_"}'], expand('~/.config/coc/extensions/coc-gist-data/secret.json'))
echo join(g:init#init#install#coc, ' ')
quit
