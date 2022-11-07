function! init#snippets#source() abort
  let g:snips_author = $DEBFULLNAME
  let g:snips_email = $EMAIL
  let g:snips_github = init#init#template#github()
endfunction
