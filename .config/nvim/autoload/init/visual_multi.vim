function! init#visual_multi#source() abort
  let g:VM_theme = 'iceblue'
  let g:VM_mouse_mappings = 1
  let g:VM_silent_exit = 1
  let g:VM_persistent_registers = 1
  let g:VM_maps = {
        \ 'Find Under': '<C-_>',
        \ 'Find Subword Under': '<C-_>',
        \ 'Motion ;': 'z;',
        \ 'Motion ,': 'z,',
        \ 'Undo': 'u',
        \ 'Redo': '<C-R>',
        \ 'Add Cursor Up': '\\k',
        \ 'Add Cursor Down': '\\j',
        \ 'Select h': '\\h',
        \ 'Select l': '\\l',
        \ 'Show Infoline': '\\i',
        \ 'Select Operator': 'gs',
        \ 'Surround': 's',
        \ 'Reselect Last': 'gS',
        \ 'Move Right': 'gl',
        \ 'Move Left': 'gh',
        \ }
endfunction
