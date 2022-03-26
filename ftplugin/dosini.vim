setlocal isfname-==
setlocal indentexpr=GetGitconfigIndent()
if expand('%:t') ==# 'mimeapps.list'
  setlocal path=~/.local/share/applications/**,/usr/share/applications/**
endif

call init#init#dosini#main()
