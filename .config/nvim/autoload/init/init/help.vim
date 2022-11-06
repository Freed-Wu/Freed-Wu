function! init#init#help#set() abort
  let b:iskeyword = &iskeyword
  setlocal iskeyword&
endfunction

function! init#init#help#unset() abort
  try
    let &l:iskeyword = b:iskeyword
    unlet b:iskeyword
  catch /^Vim\%((\a\+)\)\=:E121:/
  endtry
endfunction
