setlocal textwidth=79
if has('python3')
  py3 import sys
  let s:path = [''] + py3eval('sys.path')
elseif has('python')
  py import sys
  let s:path = [''] + pyeval('sys.path')
else
  execute 'let s:path =' system("python -c 'import sys; print(sys.path)'")
endif
let &l:path = join(s:path, ',')

nnoremap <silent><buffer> <LocalLeader>t :<C-U>CocCommand pyright.createtypestub <C-R><C-W><CR>
nnoremap <silent><buffer> <LocalLeader>s :<C-U>%s/^\S/# &/g<CR>:%s/^# \%(>>> \\|^\.\.\. \)//g<CR>

" https://github.com/tpict/vim-ftplugin-python/pull/15
let b:match_skip = 's:comment\|string\|character\|special'
autocmd CursorMoved <buffer> let b:match_words = s:BuildMatchWords()

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
call textobj#user#map('continuous', {
      \ 'python': {
        \ 'select-a': '<buffer>aL',
        \ 'select-i': '<buffer>iL',
        \ },
        \ })
