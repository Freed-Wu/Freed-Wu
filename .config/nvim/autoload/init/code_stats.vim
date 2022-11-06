function! init#code_stats#source() abort
  let g:codestats_api_key = $CODESTATS_API_KEY
endfunction

augroup init#codestats
  autocmd!
  autocmd VimEnter * autocmd! codestats TextChanged
augroup END
