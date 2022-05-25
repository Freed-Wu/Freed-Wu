function! init#init#map#2leftmouse() abort
  call feedkeys("\<LeftMouse>", 'n')
  call CocActionAsync('jumpDefinition')
endfunction

function! init#init#map#rightmouse() abort
  if exists('*nvim_open_win') || exists('*popup_create')
    let b:context = map([
          \ ['&Menu', 'call quickui#menu#open()'],
          \ ['&Search', 'CocList -I -A grep'],
          \ ] , {_, v -> v + [get(v, 1)]})
    call quickui#context#open(b:context, {})
  endif
endfunction
