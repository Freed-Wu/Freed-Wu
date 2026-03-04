nnoremap <buffer> <LocalLeader>lv :<C-U>call pandoc#hypertext#OpenSystem(expand('%:p:r') . '.pdf')<CR>
