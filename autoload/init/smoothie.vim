function! init#smoothie#source() abort
  let g:smoothie_experimental_mappings = 1
  " <Cmd>
  if !has('nvim-0.5.0') && !has('patch-8.1.1564')
    let g:smoothie_no_default_mappings = 1
  endif
endfunction
