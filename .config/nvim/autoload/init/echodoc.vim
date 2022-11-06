function! init#echodoc#source() abort
  let g:echodoc#enable_at_startup = 1
  if exists('*nvim_open_win')
    let g:echodoc#type = 'floating'
  elseif exists('*popup_create')
    let g:echodoc#type = 'popup'
  endif
endfunction
