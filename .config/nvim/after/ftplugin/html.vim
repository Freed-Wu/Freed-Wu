if expand('%:p:r') =~# '^zhihu://'
  let b:browser_search_default_engine = 'zhihu'
else
  let b:browser_search_default_engine = 'mdn'
endif
