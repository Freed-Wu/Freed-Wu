" $VIMRUNTIME/lua/vim/filetype.lua
" vint: -ProhibitAutocmdWithNoGroup

" https://github.com/vim/vim/pull/16428
au BufNewFile,BufRead .rgignore,.ignore,.dockerignore,.npmignore,.vscodeignore	setf gitignore

au BufNewFile,BufRead *.{lua,tlu,rockspec} set ft=teal
au BufNewFile,BufRead *.gel setf gel
au BufNewFile,BufRead *.sa,*.asm set ft=tiasm
au BufNewFile,BufRead *.cmd set ft=lnk
au BufNewFile,BufRead *.map set ft=lnkmap
