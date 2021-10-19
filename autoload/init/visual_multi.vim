function! init#visual_multi#source() abort
  let g:VM_theme = 'iceblue'
  let g:VM_mouse_mappings = 1
  let g:VM_silent_exit = 1
  let g:VM_persistent_registers = 1
  let g:VM_maps = {}
  let g:VM_maps['Find Under'] = '<C-_>'
  let g:VM_maps['Find Subword Under'] = '<C-_>'
  let g:VM_maps['Motion ;'] = 'z;'
  let g:VM_maps['Motion ,'] = 'z,'
  let g:VM_maps['Undo'] = 'u'
  let g:VM_maps['Redo'] = '<C-R>'
  let g:VM_maps['Add Cursor Up'] = '\\k'
  let g:VM_maps['Add Cursor Down'] = '\\j'
  let g:VM_maps['Select h'] = '\\h'
  let g:VM_maps['Select l'] = '\\l'
  let g:VM_maps['Show Infoline'] = '\\i'
  let g:VM_maps['Select Operator'] = 'gs'
  let g:VM_maps['Surround'] = 's'
  let g:VM_maps['Reselect Last'] = 'gS'
  let g:VM_maps['Move Right'] = 'gl'
  let g:VM_maps['Move Left'] = 'gh'
endfunction
