setlocal indentexpr=GetGitconfigIndent()

if expand('%:t') ==# 'pyproject.toml'
  let b:browser_search_default_engine = 'pypi'
elseif expand('%:t') ==# 'rocks.toml' || expand('%:t') ==# 'lux.toml'
  let b:browser_search_default_engine = 'luarocks'
  setlocal path=.,~/.local/share/nvim/site/pack/luarocks/opt,~/.local/lib/luarocks/*
endif

call init#init#dosini#main()
