" $VIMRUNTIME/lua/vim/filetype.lua
" vint: -ProhibitAutocmdWithNoGroup
" Data_Describe {{{1 "
autocmd BufNewFile,BufRead .*ignore setfiletype gitignore
autocmd BufNewFile,BufRead .git setfiletype yaml
" 1}}} Data_Describe "

" Script {{{1 "
autocmd BufNewFile,BufRead *.cmd setfiletype ld
autocmd BufNewFile,BufRead *.la setfiletype sh
" 1}}} Script "

" Compile {{{1 "
autocmd BufNewFile,BufRead *.sa setfiletype asm
autocmd BufNewFile,BufRead *.mlir setfiletype mlir
autocmd BufNewFile,BufRead *.llvm setfiletype llvm
autocmd BufNewFile,BufRead *.cl setfiletype opencl
autocmd BufNewFile,BufRead *.gel setfiletype c
" 1}}} Compile "
" ex: foldmethod=marker
