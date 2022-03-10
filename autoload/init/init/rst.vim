function! init#init#rst#includeexpr() abort
  let l:fname = substitute(v:fname, '\.', '/', 'g')
  for l:ext in ['/__init__.py', '.py', '.rst', '.md']
    let l:file = findfile(l:fname . l:ext)
    if !empty(l:file)
      return l:file
    endif
  endfor
  return l:fname
endfunction

function! init#init#rst#map() abort
  nnoremap <silent><buffer> <LocalLeader># :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,#<CR>
  nnoremap <silent><buffer> <LocalLeader>* :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,*<CR>
  nnoremap <silent><buffer> <LocalLeader>= :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,=<CR>
  nnoremap <silent><buffer> <LocalLeader>- :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,-<CR>
  nnoremap <silent><buffer> <LocalLeader>^ :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,^<CR>
  nnoremap <silent><buffer> <LocalLeader>" :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,"<CR>
endfunction
