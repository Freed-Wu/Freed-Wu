function! init#init#filetype#edit() abort
  execute 'edit $XDG_CONFIG_HOME/nvim/ftplugin/' . get(split(&filetype, '\.'), 0) . '.vim'
endfunction
