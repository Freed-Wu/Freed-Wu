setlocal textwidth=79
if has('pythonx')
  py3 import sys
  let s:path = [''] + pyxeval('sys.path')
else
  let s:path = eval(trim(system("python -c 'import sys; print(sys.path)'")))
endif
let &l:path = join(s:path, ',')

nnoremap <silent><nowait><buffer> <LocalLeader> :call init#init#quickui#install('normal/python')<CR>
xnoremap <silent><nowait><buffer> <LocalLeader> :<C-U>call init#init#quickui#install('visual/python')<CR>

let b:browser_search_default_engine = 'pypi'

" https://github.com/tpict/vim-ftplugin-python/pull/15
let b:match_skip = 's:comment\|string\|character\|special'

augroup init_python
  autocmd!
  autocmd CursorMoved <buffer> let b:match_words = s:BuildMatchWords()
augroup END

function! s:BuildMatchWords()
  if indent('.') > 0
    let start_pattern = '\%(^'.repeat(' ', indent('.')).'\)\@<='
  else
    let start_pattern = '^'
  endif

  return join([
        \ start_pattern.'if\>',
        \ start_pattern.'elif\>',
        \ start_pattern.'else\>',
        \ ], ':')
endfunction

call init#init#rst#map()
call init#textobj#map('continuous', 'continuous/python')
