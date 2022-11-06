function! init#windowswap#source() abort
  let g:windowswap_map_keys = 0
  nnoremap <silent> <C-W>. :<C-U>call WindowSwap#EasyWindowSwap()<CR>
endfunction
