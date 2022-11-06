setlocal isfname-==

compiler vimdoc

let b:chalk_space_before = 1

if expand('%:p') ==# $MYVIMRC
  call init#init#dein#main()
endif

if &buftype ==# 'nofile'
  nnoremap <buffer><silent> <CR> <CR>
  nnoremap <buffer><silent> ZZ <C-C>
  nnoremap <silent><buffer><silent> ZQ :<C-U>quit<CR>
endif

call init#init#vim#map()
call init#textobj#map('continuous', 'continuous/vim')

nnoremap <silent><buffer> K :<C-U>call CocAction('doHover')<CR>
nmap <buffer> gK <Plug>ScripteaseHelp
