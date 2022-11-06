function! init#table_mode#source() abort
  let g:table_mode_disable_mappings = 1
  let g:table_mode_disable_tableize_mappings = 1
  let g:table_mode_tableize_auto_border = 1
  let g:table_mode_always_active = 1
  let g:table_mode_map_prefix = ''
  let g:table_mode_toggle_map = ''
  nmap [<Bar> <Plug>(table-mode-motion-left)
  nmap ]<Bar> <Plug>(table-mode-motion-right)
  nmap <lt><Bar> <Plug>(table-mode-motion-up)
  nmap ><Bar> <Plug>(table-mode-motion-down)
endfunction
