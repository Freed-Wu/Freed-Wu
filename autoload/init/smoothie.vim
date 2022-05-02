function! init#smoothie#source() abort
  let g:smoothie_no_default_mappings = 1
  nmap <C-D> <Plug>(SmoothieDownwards)
  nmap <C-U> <Plug>(SmoothieUpwards)
  nmap <C-F> <Plug>(SmoothieForwards)
  nmap <C-B> <Plug>(SmoothieBackwards)
  " https://github.com/psliwka/vim-smoothie/issues/34
  " nmap gg    <Plug>(Smoothie_gg)
  nmap G     <Plug>(Smoothie_G)
  if has('nvim-0.5.0') && has('patch-8.1.1564')
    xmap <C-D> <Plug>(SmoothieDownwards)
    xmap <C-U> <Plug>(SmoothieUpwards)
    xmap <C-F> <Plug>(SmoothieForwards)
    xmap <C-B> <Plug>(SmoothieBackwards)
    xmap gg    <Plug>(Smoothie_gg)
    xmap G     <Plug>(Smoothie_G)
  endif
endfunction

if !has('nvim-0.5.0') && !has('patch-8.1.1564')
  augroup init#smoothie
    autocmd!
    autocmd VimEnter * call s:remap()
  augroup END
  function! s:remap() abort
    noremap <silent> <Plug>(SmoothieDownwards) :<C-U>call smoothie#downwards()           <CR>
    noremap <silent> <Plug>(SmoothieUpwards)   :<C-U>call smoothie#upwards()             <CR>
    noremap <silent> <Plug>(SmoothieForwards)  :<C-U>call smoothie#forwards()            <CR>
    noremap <silent> <Plug>(SmoothieBackwards) :<C-U>call smoothie#backwards()           <CR>
    noremap <silent> <Plug>(Smoothie_gg)       :<C-U>call smoothie#cursor_movement('gg') <CR>
    noremap <silent> <Plug>(Smoothie_G)        :<C-U>call smoothie#cursor_movement('G')  <CR>
  endfunction
endif
