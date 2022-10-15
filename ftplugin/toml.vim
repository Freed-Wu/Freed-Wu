setlocal indentexpr=GetGitconfigIndent()

if expand('%:t') ==# 'pyproject.toml'
  let g:browser_search_default_engine = 'pypi'
endif

call init#init#dosini#main()
