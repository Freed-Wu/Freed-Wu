.!echo "\" $ uname -r\n\" $(uname -r)"%HERE%
.!echo "\" $ has\n\" $(has | ansifilter)"
" $ cat test.vim
set runtimepath=$VIMRUNTIME
set runtimepath+=~/.local/share/nvim/repos/github.com/
let g:coc_config_home = '.'
" $ cat coc-settings.json
" $ vi -u test.vim
