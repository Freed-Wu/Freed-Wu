function! init#subversive#source() abort
  let g:subversiveCurrentTextRegister = 'r'
  xmap p <Plug>(SubversiveSubstitute)
  nmap + <Plug>(SubversiveSubstitute)
  nmap ++ <Plug>(SubversiveSubstituteToEndOfLine)
endfunction
