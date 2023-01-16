call init#snippets#source()
function! init#template#source() abort
  let g:username = $DEBFULLNAME
  let g:email = $EMAIL
  let g:templates_global_name_prefix = ''
  let g:templates_directory = [expand('$XDG_CONFIG_HOME/nvim/template')]
  let g:templates_user_variables = [
        \ ['DIR', 'init#init#template#dir'],
        \ ['DIR_', 'init#init#template#dir_'],
        \ ['DIR2', 'init#init#template#dir2'],
        \ ['DIR3', 'init#init#template#dir3'],
        \ ['CFILE', 'init#init#template#cfile'],
        \ ['FILE_', 'init#init#template#file_'],
        \ ['TEST_FILE', 'init#init#template#test_file'],
        \ ['EXT', 'init#init#template#ext'],
        \ ['GITHUB', 'init#init#template#github'],
        \ ['GITHUB_USER', 'init#init#template#github_user'],
        \ ['DOCKERHUB_USER', 'init#init#template#dockerhub_user'],
        \ ]
endfunction
