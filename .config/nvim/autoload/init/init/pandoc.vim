function! init#init#pandoc#main() abort
  try
    call vimtex#init()
    call init#init#tex#main()
  catch /^Vim\%((\a\+)\)\=:E117:/
  endtry

  setlocal iskeyword+=-

  let b:browser_search_default_engine = 'google'

  nmap <buffer> <LocalLeader>lv <Plug>MarkdownPreviewToggle
  " nnoremap <buffer> <LocalLeader>lv :<C-U>CocCommand markdown-preview-enhanced.openPreview<CR>
  " nnoremap <buffer> <LocalLeader>li :<C-U>CocCommand markdown-preview-enhanced.openImageHelper<CR>
  " nnoremap <buffer> <LocalLeader>ll :<C-U>CocCommand markdown-preview-enhanced.runCodeChunk<CR>
  " nnoremap <buffer> <LocalLeader>lL :<C-U>CocCommand markdown-preview-enhanced.runAllCodeChunks<CR>
  nnoremap <silent><buffer> <LocalLeader>= :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,=<CR>
  nnoremap <silent><buffer> <LocalLeader>- :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,-<CR>

  call init#textobj#map('pandoc')
  call init#init#sphinx#set()
endfunction
