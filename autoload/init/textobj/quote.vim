function! init#textobj#quote#source() abort
  let g:textobj#quote#doubleMotion = 'K'
  let g:textobj#quote#singleMotion = 'k'
  let g:textobj#quote#educate = 0
  nmap csq <Plug>ReplaceWithCurly
  nmap csQ <Plug>ReplaceWithStraight
  xmap sq <Plug>ReplaceWithCurly
  xmap sQ <Plug>ReplaceWithStraight
  xmap sk <Plug>SurroundWithSingle
  xmap sK <Plug>SurroundWithDouble
endfunction

function! init#textobj#quote#post_source() abort
  augroup init#textobj#quote
    autocmd!
    autocmd VimEnter * call textobj#quote#init()
  augroup END
endfunction
