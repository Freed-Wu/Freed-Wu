function! init#vimspector#source() abort
  nnoremap <silent> <BS> :<C-U>call vimspector#StepOver()<CR>
  nnoremap <silent> g<BS> :<C-U>call vimspector#StepInto()<CR>
  nnoremap <silent> z<BS> :<C-U>call vimspector#StepOut()<CR>
  nnoremap <silent> [y :<C-U>call vimspector#UpFrame()<CR>
  nnoremap <silent> ]y :<C-U>call vimspector#DownFrame()<CR>
endfunction
