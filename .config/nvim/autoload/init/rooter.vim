function! init#rooter#source() abort
  let g:rooter_patterns = ['.git', '>.config', '>share']
  let g:rooter_change_directory_for_non_project_files = 'current'
endfunction
