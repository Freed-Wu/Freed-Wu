function! init#init#filetype#edit() abort
  execute 'edit $XDG_CONFIG_NVIM/after/ftplugin/' . get(split(&filetype, '\.'), 0) . '.vim'
endfunction
