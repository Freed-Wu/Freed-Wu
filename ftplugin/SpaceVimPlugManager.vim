call init#init#dein#main()

setlocal keywordprg=:help
setlocal path=$XDG_DATA_HOME/nvim/repos/github.com/*
setlocal nofoldenable
setlocal norelativenumber

nnoremap <buffer> [[ ?^x<CR>
nnoremap <buffer> ]] /^x<CR>
