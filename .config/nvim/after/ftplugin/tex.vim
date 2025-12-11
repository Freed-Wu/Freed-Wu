setlocal spell

let b:browser_search_default_engine = 'ctan'
if expand('%:e') ==# 'dtx'
  let b:match_words = '%<\*driver>:%<\/driver>,%<\*cls>:%<\/cls>,%<\*sty>:%<\/sty>,%<\*cls|sty>:%<\/cls|sty>'
endif
