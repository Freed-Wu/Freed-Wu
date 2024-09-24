" $VIMRUNTIME/lua/vim/filetype.lua
" vint: -ProhibitAutocmdWithNoGroup
" Data_Describe {{{1 "
autocmd BufNewFile,BufRead .*ignore setfiletype gitignore
autocmd BufNewFile,BufRead .git setfiletype yaml
" 1}}} Data_Describe "

" Script {{{1 "
" https://github.com/vim/vim/pull/15751
autocmd BufNewFile,BufRead *.l{o,a{,i}} setfiletype sh
" 1}}} Script "

" Compile {{{1 "
" https://github.com/vim/vim/pull/15824
autocmd BufNewFile,BufRead *.ll set filetype=llvm
" https://github.com/vim/vim/pull/15825
autocmd BufNewFile,BufRead *.cl setfiletype opencl
" https://github.com/vim/vim/pull/15826
autocmd BufNewFile,BufRead *.mlir setfiletype mlir
" https://github.com/vim/vim/pull/15827
autocmd BufNewFile,BufRead *.cmd setfiletype ld
autocmd BufNewFile,BufRead *.sa setfiletype asm
autocmd BufNewFile,BufRead *.gel setfiletype c
" 1}}} Compile "
" ex: foldmethod=marker
