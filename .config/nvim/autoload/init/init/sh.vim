function! init#init#sh#map() abort
  call init#init#sh#context()
  nnoremap <silent><buffer> [[ ?^\s*\w\+(\s*)\_s*{<CR>:let @/ = ''<CR>
  nnoremap <silent><buffer> ]] /^\s*\w\+(\s*)\_s*{<CR>:let @/ = ''<CR>
  nnoremap <silent><buffer> [] ?^\s*}$<CR>:let @/ = ''<CR>
  nnoremap <silent><buffer> ][ /^\s*}$<CR>:let @/ = ''<CR>
  xnoremap <silent><buffer> [[ ?^\s*\w\+(\s*)\_s*{<CR>
  xnoremap <silent><buffer> ]] /^\s*\w\+(\s*)\_s*{<CR>
  xnoremap <silent><buffer> [] ?^\s*}$<CR>
  xnoremap <silent><buffer> ][ /^\s*}$<CR>
  onoremap <silent><buffer> [[ ?^\s*\w\+(\s*)\_s*{<CR>
  onoremap <silent><buffer> ]] /^\s*\w\+(\s*)\_s*{<CR>
  onoremap <silent><buffer> [] ?^\s*}$<CR>
  onoremap <silent><buffer> ][ /^\s*}$<CR>
endfunction

function! init#init#sh#context() abort
  nnoremap <silent><nowait><buffer> <LocalLeader> :call init#init#quickui#install('normal/sh')<CR>
  xnoremap <silent><nowait><buffer> <LocalLeader> :call init#init#quickui#install('visual/sh')<CR>
endfunction

function! init#init#sh#echo() abort
  let l:word = init#parse(a:)
  echo system('echo ' . l:word)
endfunction

function! init#init#sh#execute() abort
  let l:word = init#parse(a:)
  let l:line = getline(l:word)
  echo system(l:line)
endfunction

function! init#init#sh#includeexpr() abort
  if v:fname[0] !=# '-'
    return v:fname
  endif
  let l:fname = substitute(v:fname, '^-.', '', 'g')
  while len(l:fname)
    if len(finddir(l:fname)) + len(findfile(l:fname))
      return l:fname
    endif
    let l:fname = l:fname[1:]
  endwhile
  return v:fname
endfunction
