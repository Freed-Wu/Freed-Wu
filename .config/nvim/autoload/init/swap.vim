function! init#swap#source() abort
  xmap [<CR> <Plug>SwapSwapOperands
  xmap ]<CR> <Plug>SwapSwapPivotOperands
  nmap [<CR> <Plug>SwapSwapWithL_WORD
  nmap ]<CR> <Plug>SwapSwapWithR_WORD
endfunction
