#!/usr/bin/env -S nvim --headless -u
source ~/.config/nvim/init.vim
call dein#update()
" https://github.com/neoclide/coc.nvim/issues/118#issuecomment-1311768351
call mkdir(expand('~/.config/coc/extensions/coc-gist-data'), 'p')
call writefile(['{"dependencies": {}}'], expand('~/.config/coc/extensions/package.json'))
call writefile(['{"token": "gho_"}'], expand('~/.config/coc/extensions/coc-gist-data/secret.json'))
let s:cmd = 'npm install -C ~/.config/coc/extensions' . join(init#init#install#coc(), ' ')
echo system(s:cmd)
quit
