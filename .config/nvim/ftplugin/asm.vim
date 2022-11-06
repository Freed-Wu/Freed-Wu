setlocal include=^\s*%\s*include
let b:match_words = '^\s*%\s*if\%(\|num\|idn\|nidn\)\>:^\s*%\s*elif\>:^\s*%\s*else\>:^\s*%\s*endif\>,^\s*%\s*macro\>:^\s*%\s*endmacro\>,^\s*%\s*rep\>:^\s*%\s*endrep\>'
let b:match_skip = 's:comment\|string\|character\|special'
let b:match_ignorecase = 1
