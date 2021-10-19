function! init#subversive#source() abort
  let g:subversiveCurrentTextRegister = 'r'
  xmap p <Plug>(SubversiveSubstitute)
  nmap + <Plug>(SubversiveSubstitute)
  nmap ++ <Plug>(SubversiveSubstituteToEndOfLine)
  nmap z- <Plug>(SubversiveSubstituteRange)
  xmap - <Plug>(SubversiveSubstituteRange)
  nmap - <Plug>(SubversiveSubstituteWordRange)
  nmap -- <Plug>(SubversiveSubstituteWordRange)$
  nmap z_ <Plug>(SubversiveSubstituteRangeConfirm)
  xmap _ <Plug>(SubversiveSubstituteRangeConfirm)
  nmap _ <Plug>(SubversiveSubstituteWordRangeConfirm)
  nmap __ <Plug>(SubversiveSubstituteWordRangeConfirm)$
endfunction
