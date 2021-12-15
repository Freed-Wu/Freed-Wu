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

nnoremap <silent> <LocalLeader>t :<C-U>CocCommand pyright.createtypestub <C-R><C-W><CR>

call textobj#user#map('continuous', {
      \ 'python': {
        \ 'select-a': '<buffer>aL',
        \ 'select-i': '<buffer>iL',
        \ },
        \ })
