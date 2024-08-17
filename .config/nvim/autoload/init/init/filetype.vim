function! init#init#filetype#edit() abort
  execute 'edit $XDG_CONFIG_NVIM/ftplugin/' . get(split(&filetype, '\.'), 0) . '.vim'
endfunction
