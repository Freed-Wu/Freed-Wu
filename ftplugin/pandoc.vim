call vimtex#init()
call init#init#tex#main()

setlocal iskeyword+=-

let b:browser_search_default_engine = 'google'

if exists('g:started_by_firenvim')
  nnoremap <silent><buffer> <LocalLeader>P
        \ :<C-U>call firenvim#eval_js(
        \ 'document.getElementById("partial-new-comment-form-actions").getElementsByClassName("btn btn-primary")[0].click()'
        \ )<CR>
endif
nmap <buffer> <LocalLeader>p <Plug>MarkdownPreview
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

call textobj#user#map('markdown', {
      \ 'text': {
        \ 'select-a': '<buffer>aF',
        \ 'select-i': '<buffer>iF',
        \ 'move-p': '<buffer>[F',
        \ 'move-n': '<buffer>]F',
        \ },
        \ 'Btext': {
          \ 'select-a': '<buffer>aE',
          \ 'select-i': '<buffer>iE',
          \ 'move-p': '<buffer>[E',
          \ 'move-n': '<buffer>]E',
          \ },
          \ 'chunk': {
            \ 'select-a': '<buffer>am',
            \ 'select-i': '<buffer>im',
            \ 'move-p': '<buffer>[m',
            \ 'move-n': '<buffer>]m',
            \ },
            \ 'Bchunk': {
              \ 'select-a': '<buffer>aM',
              \ 'select-i': '<buffer>iM',
              \ 'move-p': '<buffer>[M',
              \ 'move-n': '<buffer>]M',
              \ },
              \ })
