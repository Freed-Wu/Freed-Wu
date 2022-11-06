function! init#targets#source() abort
  let g:targets_nl = ['n', 'N']
  " avoid conflict with vim-which-key
  let g:targets_aiAI = ['<Plug>(init-targets-a)', '<Plug>(init-targets-i)', '<Plug>(init-targets-A)', '<Plug>(init-targets-I)']

  for s:target in ['(', ')', '[', ']', '{', '}', '<', '>', 't', 'b',
        \ "'", '"', '`', 'q', 'a',
        \ ',', '.', ';', '+', '-', '=', '~', '_', '*', '#',
        \ '/', '<Bar>', '\', '&', '$',
        \ ] + g:targets_nl
    for s:key in ['a', 'i', 'A', 'I']
      execute 'xmap' s:key . s:target '<Plug>(init-targets-' . s:key. ')' . s:target
      execute 'omap' s:key . s:target '<Plug>(init-targets-' . s:key. ')' . s:target
    endfor
  endfor
endfunction
