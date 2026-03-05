scriptencoding utf-8

function! init#smartinput#source() abort
  let g:smartinput_break_undo = 1
endfunction

function! init#smartinput#post_source() abort
  call smartinput#extra#zh()
  call smartinput#extra#en()
  call smartinput#extra#op()
endfunction
