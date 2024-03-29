" https://github.com/rime/home/wiki/Configuration#%E5%8C%85%E5%90%AB
setlocal include=__include:\s*
setlocal path=.,,/sdcard/rime,/sdcard/rime-data
setlocal path+=~/.local/share/rime,~/.local/share/rime-data
setlocal path+=~/.local/state/nix/profile/share/rime-data
setlocal path+=/usr/local/share/rime-data,/usr/share/rime-data
setlocal path+=/run/current-system/sw/share/rime-data
setlocal isfname=@,48-57,_,-,.
setlocal includeexpr=init#init#rime#includeexpr()

" ~/.config/nvim/compiler/rime_deploy.vim
compiler rime_deploy

nnoremap <buffer><silent> <LocalLeader>e :<C-U>call init#init#rime#switch()<CR>
