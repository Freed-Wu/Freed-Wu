scriptencoding utf-8

nnoremap <buffer> ZQ i<C-U><C-D>
nnoremap <silent><buffer> ZZ :<C-U>hide<CR>
nnoremap <silent><buffer> [[ ?❯<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ]] /❯<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> [] /❯<CR>:let @/ = ''<CR>2k
nnoremap <silent><buffer> [] ?❯<CR>:let @/ = ''<CR>2j
if has('nvim')
  nnoremap <buffer> p i<C-\><C-N>"+pi
  nnoremap <buffer> <expr> P 'i<C-\><C-N>"'.nr2char(getchar()).'pi'
else
  nnoremap <buffer> p i<C-W>"+
  nnoremap <buffer> P i<C-W>"
endif
if exists('g:terminal_map') || has('nvim')
  finish
endif
let g:terminal_map = 1
tnoremap <nowait> <C-W> <C-W>.
tnoremap <C-\><C-N> <C-W>N
tnoremap <C-\><C-\> <C-W><C-\>
if has('gui_running')
  for s:i in range(char2nr('0'), char2nr('9')) + range(char2nr('a'), char2nr('z'))
    execute 'tnoremap <silent> <M-' . nr2char(s:i) . '> <Esc>' . nr2char(s:i)
  endfor
  let s:map = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')']
  for s:i in range(10)
    execute 'tnoremap <silent> <M-S-' . s:i . '> <Esc>' . s:map[s:i]
  endfor
  for s:i in range(char2nr('a'), char2nr('z'))
    execute 'tnoremap <silent> <M-S-' . nr2char(s:i) . '> <Esc><S-' . nr2char(s:i) . '>'
  endfor
else
  for s:i in range(char2nr('0'), char2nr('9')) + range(char2nr('a'), char2nr('z')) + range(char2nr('A'), char2nr('Z'))
    execute 'tnoremap <silent> <Esc>' . nr2char(s:i) . ' <Esc>' . nr2char(s:i)
  endfor
  for s:i in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')']
    execute 'tnoremap <silent> <Esc>' . s:i . ' <Esc>' . s:i
  endfor
endif
