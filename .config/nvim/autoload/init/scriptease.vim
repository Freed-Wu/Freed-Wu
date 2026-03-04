function! init#scriptease#source() abort
  nnoremap <silent> zS :<C-U>execute scriptease#synnames_map(1 - v:count)<CR>
endfunction
