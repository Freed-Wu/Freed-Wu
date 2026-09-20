function! init#init#markdown#main() abort
  setlocal iskeyword+=-

  if expand('%:p:r') =~# '^zhihu://'
    let b:browser_search_default_engine = 'zhihu'
  else
    let b:browser_search_default_engine = 'google'
  endif

  nnoremap <silent><buffer> <LocalLeader>lv :<C-U>CocCommand markdown-preview-enhanced.openPreview<CR>
  nnoremap <silent><buffer> <LocalLeader>li :<C-U>CocCommand markdown-preview-enhanced.openImageHelper<CR>
  nnoremap <silent><buffer> <LocalLeader>ll :<C-U>CocCommand markdown-preview-enhanced.runCodeChunk<CR>
  nnoremap <silent><buffer> <LocalLeader>lL :<C-U>CocCommand markdown-preview-enhanced.runAllCodeChunks<CR>
  nnoremap <silent><buffer> <LocalLeader>= :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,=<CR>
  nnoremap <silent><buffer> <LocalLeader>- :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,-<CR>

  call init#init#sphinx#set()
endfunction
