function! init#xkbswitch#source() abort
  if filereadable('/run/current-system/sw/lib/libg3kbswitch.so')
    let g:XkbSwitchLib = '/run/current-system/sw/lib/libg3kbswitch.so'
  endif
  let g:XkbSwitchNLayout = 'us'
  let g:XkbSwitchEnabled = 1
endfunction
