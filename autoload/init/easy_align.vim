function! init#easy_align#source() abort
  let g:easy_align_bypass_fold = 1
  let g:easy_align_delimiters = {
        \ '>': {'pattern': '>>\|=>\|>'},
        \ '/': {
          \ 'pattern': '//\+\|/\*\|\*/',
          \ 'delimiter_align': 'l',
          \ 'ignore_groups': ['!Comment'],
          \ },
          \ ']': {
            \ 'pattern': '[[\]]',
            \ 'left_margin': 0,
            \ 'right_margin': 0,
            \ 'stick_to_left': 0,
            \ },
            \ ')': {
              \ 'pattern': '[()]',
              \ 'left_margin': 0,
              \ 'right_margin': 0,
              \ 'stick_to_left': 0,
              \ },
              \ 'd': {
                \ 'pattern': ' \ze\S\+\s*[;=]',
                \ 'left_margin': 0,
                \ 'right_margin': 0,
                \ },
                \ }
  nmap gz <Plug>(EasyAlign)
  xmap gz <Plug>(EasyAlign)
endfunction
