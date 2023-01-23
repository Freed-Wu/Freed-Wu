function! init#code_stats#source() abort
  let g:codestats_api_key = join(readfile(expand(
        \ '$HOME/.local/share/zinit/plugins/.pass/codestats.txt'
        \ )))
endfunction

augroup init#codestats
  autocmd!
  autocmd VimEnter * autocmd! codestats TextChanged
augroup END
