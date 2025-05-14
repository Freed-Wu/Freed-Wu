setlocal isfname-==
setlocal indentexpr=GetGitconfigIndent()
if expand('%:t') ==# 'mimeapps.list'
  setlocal path=~/.local/share/applications/**,/usr/share/applications/**
elseif expand('%:t') ==# 'setup.cfg'
  let b:browser_search_default_engine = 'pypi'
elseif expand('%:t') ==# 'dist.ini'
  let b:browser_search_default_engine = 'cpan'
endif

call init#init#dosini#main()
