function! init#pandoc#source() abort
  " same as prettier
  let g:pandoc#formatting#textwidth = 80
  let g:pandoc#folding#fold_yaml = 1
  let g:pandoc#folding#fold_fenced_codeblocks = 1
  let g:pandoc#folding#fastfolds = 1
  let g:pandoc#compiler#arguments = '-fmarkdown+east_asian_line_breaks+emoji --pdf-engine=xelatex -s'
  nnoremap <silent> gx :<C-U>call pandoc#hypertext#OpenSystem()<CR>
  xnoremap <silent> gx :<C-U>call pandoc#hypertext#OpenSystem(getline('.')[col('v') - 1:col('''>') - 1])<CR>
endfunction
