function! init#snippets#source() abort
  let g:snips_author = $GITHUB_USER
  let g:snips_email = $EMAIL
  let g:snips_github = 'https://github.com/' . $GITHUB_USER
endfunction
