function! init#swap#source() abort
  xmap [E <Plug>SwapSwapOperands
  xmap ]E <Plug>SwapSwapPivotOperands
  " unimpaired use [e and ]e to swap line
  nmap [E <Plug>SwapSwapWithL_WORD
  nmap ]E <Plug>SwapSwapWithR_WORD
endfunction
