.!echo "\" $ uname -r\n\" $(uname -r)"%HERE%
.!echo "\" $ has nvim\n\" $(has nvim | ansifilter)"
.!echo "\" $ has python\n\" $(has python | ansifilter)"
" $ cat test.vim
set runtimepath=$VIMRUNTIME
set runtimepath+=~/.local/share/nvim/repos/github.com/
let g:coc_config_home = '.'
" $ cat coc-settings.json
" $ vi -u test.vim
