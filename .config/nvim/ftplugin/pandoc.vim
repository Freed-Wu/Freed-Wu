try
  let s:comments = &l:comments
  let s:commentstring = &l:commentstring
  call vimtex#init()
  call init#init#tex#main()
  let &l:comments = s:comments
  let &l:commentstring = s:commentstring
catch /^Vim\%((\a\+)\)\=:E117:/
endtry

setlocal iskeyword+=-

let b:browser_search_default_engine = 'google'

nnoremap <buffer> <LocalLeader><LocalLeader> :<C-U>PandocHighlight <C-R><C-W><CR>
nnoremap <buffer> <LocalLeader>lv :<C-U>CocCommand markdown-preview-enhanced.openPreview<CR>
nnoremap <buffer> <LocalLeader>li :<C-U>CocCommand markdown-preview-enhanced.openImageHelper<CR>
nnoremap <buffer> <LocalLeader>ll :<C-U>CocCommand markdown-preview-enhanced.runCodeChunk<CR>
nnoremap <buffer> <LocalLeader>lL :<C-U>CocCommand markdown-preview-enhanced.runAllCodeChunks<CR>
nnoremap <silent><buffer> <LocalLeader>= :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,=<CR>
nnoremap <silent><buffer> <LocalLeader>- :<C-U>CommentBanner -w auto -1 spaces:0 -p 1,-<CR>
nnoremap <buffer> gf gf
nmap <buffer> <LocalLeader>f <Plug>(pandoc-hypertext-open-local)
nnoremap <silent><buffer> <LocalLeader>vb :<C-U>Pandoc beamer<CR>
nnoremap <silent><buffer> <LocalLeader>vB :<C-U>Pandoc! beamer<CR>
nnoremap <silent><buffer> <LocalLeader>vp :<C-U>Pandoc pdf<CR>
nnoremap <silent><buffer> <LocalLeader>vP :<C-U>Pandoc! pdf<CR>
nnoremap <silent><buffer> <LocalLeader>vd :<C-U>Pandoc docx<CR>
nnoremap <silent><buffer> <LocalLeader>vD :<C-U>Pandoc! docx<CR>

call init#textobj#map('pandoc')
call init#init#sphinx#set()
