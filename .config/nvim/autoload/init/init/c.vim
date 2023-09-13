function! init#init#c#nix() abort
  if !exists('s:nix_include')
    let s:nix_include = eval(trim(system('nix-instantiate --eval -E ''"${(import <nixpkgs> {}).stdenv.cc.libc.dev}/include"''')))
  endif
  return s:nix_include
endfunction

function! init#init#c#main() abort
  set path+=~/.local/include,~/.local/stat/nix/profile/include
  if filereadable('/run/current-system/nixos-version')
    setlocal path-=/usr/include
    let &l:path .= ',' . init#init#c#nix()
  else
    setlocal path+=/usr/local/include,/usr/src/linux/include
  endif

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
