function! init#scriptease#source() abort
  if has('nvim')
    nnoremap <silent> zS :<C-U>Inspect<CR>
  else
    nnoremap <silent> zS :<C-U>execute scriptease#synnames_map(1 - v:count)<CR>
  endif
endfunction
