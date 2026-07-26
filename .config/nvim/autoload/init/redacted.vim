function! init#redacted#source() abort
  nmap gz <Plug>Redact
  nmap gzz :Redact!
  xmap gz <Plug>Redact
endfunction
