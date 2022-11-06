function! init#textobj#word_column#source() abort
  let g:skip_default_textobj_word_column_mappings = 1
  xnoremap <silent> a<Tab> :<C-U>call TextObjWordBasedColumn('aw')<CR>
  xnoremap <silent> a<S-Tab> :<C-U>call TextObjWordBasedColumn('aW')<CR>
  xnoremap <silent> i<Tab> :<C-U>call TextObjWordBasedColumn('iw')<CR>
  xnoremap <silent> i<S-Tab> :<C-U>call TextObjWordBasedColumn('iW')<CR>
  onoremap <silent> a<Tab> :<C-U>call TextObjWordBasedColumn('aw')<CR>
  onoremap <silent> a<S-Tab> :<C-U>call TextObjWordBasedColumn('aW')<CR>
  onoremap <silent> i<Tab> :<C-U>call TextObjWordBasedColumn('iw')<CR>
  onoremap <silent> i<S-Tab> :<C-U>call TextObjWordBasedColumn('iW')<CR>
endfunction
