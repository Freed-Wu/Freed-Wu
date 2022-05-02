call init#snippets#source()
function! init#template#source() abort
  let g:username = $DEBFULLNAME
  let g:email = $EMAIL
  let g:templates_global_name_prefix = ''
  let g:templates_directory = [expand('$XDG_CONFIG_HOME/nvim/template')]
  let g:templates_user_variables = [
        \ ['FILE_', 'init#init#template#file_'],
        \ ['GITHUB', 'init#init#template#github'],
        \ ]
endfunction
