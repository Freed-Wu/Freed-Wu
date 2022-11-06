function! init#init#map#2leftmouse() abort
  call feedkeys("\<LeftMouse>", 'n')
  call CocActionAsync('jumpDefinition')
endfunction
