function! init#init#vimtex#texdoc(context) abort
  call vimtex#doc#make_selection(a:context)
  if !empty(a:context.selected)
    execute 'silent !texdoc' a:context.selected '&'
  endif
  return 1
endfunction
