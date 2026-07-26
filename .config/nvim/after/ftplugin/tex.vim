setlocal spell

let b:browser_search_default_engine = 'ctan'
if expand('%:e') ==# 'dtx'
  let b:match_words = '%<\*driver>:%<\/driver>,%<\*cls>:%<\/cls>,%<\*sty>:%<\/sty>,%<\*cls|sty>:%<\/cls|sty>'
endif
nnoremap <silent><buffer> <LocalLeader>lv :<C-U>CocCommand latex.ForwardSearch<CR>
nnoremap <silent><buffer> <LocalLeader>ll :<C-U>CocCommand latex.Build<CR>
