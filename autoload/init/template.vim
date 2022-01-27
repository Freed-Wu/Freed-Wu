function! init#template#source() abort
  let g:email = $EMAIL
  let g:templates_global_name_prefix = ''
  let g:templates_directory = [$XDG_CONFIG_HOME . '/nvim/template']
endfunction
