call init#init#dein#main()

setlocal keywordprg=:help
setlocal path=$XDG_DATA_HOME/nvim/repos/github.com/*
setlocal nofoldenable
setlocal norelativenumber

nnoremap <silent><buffer> [[ ?^x<CR>:let @/ = ''<CR>
nnoremap <silent><buffer> ]] /^x<CR>:let @/ = ''<CR>
