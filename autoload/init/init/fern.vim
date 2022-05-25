function! init#init#fern#leftmouse() abort
  call feedkeys("\<LeftMouse>", 'n')
  call feedkeys('o')
endfunction

function! init#init#fern#2leftmouse() abort
  call feedkeys("\<LeftMouse>", 'n')
  call feedkeys('i')
endfunction

function! init#init#fern#cleftmouse() abort
  call feedkeys("\<LeftMouse>", 'n')
  call feedkeys('s')
endfunction

function! init#init#fern#middlemouse() abort
  call feedkeys('gu')
endfunction

function! init#init#fern#rightmouse() abort
  if exists('*nvim_open_win') || exists('*popup_create')
    let b:context = map([
          \ ['&Menu', 'call quickui#menu#open()'],
          \ ['&Up Dir', 'call feedkeys("gu")'],
          \ ['&Return CWD', 'call feedkeys("gU")'],
          \ ] , {_, v -> v + [get(v, 1)]})
    call quickui#context#open(b:context, {})
  endif
endfunction
