function! init#fcitx#source() abort
  let g:airline#extensions#xkblayout#enabled = 1
  if isdirectory('/run/current-system/sw/lib/python3.10/site-packages/dbus')
    py3 sys.path.insert(0, "/run/current-system/sw/lib/python3.10/site-packages")
    py3 import dbus
    py3 sys.path.pop(0)
  endif
  " https://github.com/lilydjwg/fcitx.vim/issues/33
  " let g:fcitx5_rime = 1
endfunction
