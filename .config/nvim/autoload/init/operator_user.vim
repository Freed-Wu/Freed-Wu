function! init#operator_user#post_source() abort
  nmap gH <Plug>(operator-left)
  nmap gL <Plug>(operator-right)
  nmap gM <Plug>(operator-center)
  xmap gH <Plug>(operator-left)
  xmap gL <Plug>(operator-right)
  xmap gM <Plug>(operator-center)
  omap gH <Plug>(operator-left)
  omap gL <Plug>(operator-right)
  omap gM <Plug>(operator-center)
	call operator#user#define_ex_command('left', 'left')
	call operator#user#define_ex_command('right', 'right')
	call operator#user#define_ex_command('center', 'center')
endfunction
