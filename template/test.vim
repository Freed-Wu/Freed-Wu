.!echo "\" $ uname -r\n\" $(uname -r)"
.!echo "\" $ has nvim\n\" $(has nvim | ansifilter)"
.!echo "\" $ has python\n\" $(has python | ansifilter)"
" $ cat test.vim
set runtimepath=$VIMRUNTIME
set runtimepath+=~/.local/share/nvim/repos/github.com/%HERE%
" $ vi -u test.vim
