function! init#init#buffer#map() abort
  if get(b:, 'map_nowait_always') == 1
    return
  endif
  let b:map_nowait = get(b:, 'map', 0)
  if b:map_nowait
    imapclear <buffer>
  else
    inoremap <buffer><nowait><Space> <Space>
    inoremap <buffer><nowait><Bar> <Bar>
    for l:nr in range(0x21, 0x7b) + range(0x7d, 0x7e)
      let l:char = nr2char(l:nr)
      execute 'inoremap <buffer><nowait>' l:char l:char
    endfor
  endif
  let b:map_nowait = !b:map_nowait
endfunction
