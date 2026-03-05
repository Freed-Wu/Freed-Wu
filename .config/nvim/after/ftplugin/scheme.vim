if expand('%:e') ==# 'stsg'
  setlocal path=/usr/share/games/supertux2
  setlocal includeexpr=init#init#gitignore#includeexpr()
endif
