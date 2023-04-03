setlocal include=^\s*%\s*include
let b:match_words = '^\s*%\s*if\%(\|num\|idn\|nidn\)\>:^\s*%\s*elif\>:^\s*%\s*else\>:^\s*%\s*endif\>,^\s*%\s*macro\>:^\s*%\s*endmacro\>,^\s*%\s*rep\>:^\s*%\s*endrep\>'
let b:match_skip = 's:comment\|string\|character\|special'
let b:match_ignorecase = 1

nnoremap <silent><buffer> [[ ?^\s*\.u\{,1\}sect\s<CR>:let @/=''<CR>
nnoremap <silent><buffer> ]] /^\s*\.u\?sect\s<CR>:let @/=''<CR>
