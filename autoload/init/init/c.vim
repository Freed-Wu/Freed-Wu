function! init#init#c#main() abort
  runtime ftplugin/c/c-fold.vim

  setlocal path+=~/.local/include

  nnoremap <silent><buffer> <LocalLeader>o :set paste<CR>i<C-R>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<CR><Esc>='[:set nopaste<CR>
  nnoremap <silent><buffer> <LocalLeader>O :set paste<CR>i<C-R>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({'includeNS': 0})<CR><Esc>='[:set nopaste<CR>
  nnoremap <silent><buffer> [[ ?{<CR>:let @/ = ''<CR>w99[{
  nnoremap <silent><buffer> ]] /}<CR>:let @/ = ''<CR>b99]}
  nnoremap <silent><buffer> ][ j0[[%/{<CR>:let @/ = ''<CR>
  nnoremap <silent><buffer> [] k$][%?}<CR>:let @/ = ''<CR>
  xnoremap <silent><buffer> [[ ?{<CR>:let @/ = ''<CR>w99[{
  xnoremap <silent><buffer> ]] /}<CR>:let @/ = ''<CR>b99]}
  xnoremap <silent><buffer> ][ j0[[%/{<CR>:let @/ = ''<CR>
  xnoremap <silent><buffer> [] k$][%?}<CR>:let @/ = ''<CR>
  onoremap <silent><buffer> [[ ?{<CR>:let @/ = ''<CR>w99[{
  onoremap <silent><buffer> ]] /}<CR>:let @/ = ''<CR>b99]}
  onoremap <silent><buffer> ][ j0[[%/{<CR>:let @/ = ''<CR>
  onoremap <silent><buffer> [] k$][%?}<CR>:let @/ = ''<CR>
endfunction
