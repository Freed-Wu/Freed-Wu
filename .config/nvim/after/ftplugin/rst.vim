setlocal tabstop=4
setlocal shiftwidth=4
setlocal path+=src
setlocal includeexpr=init#init#rst#includeexpr()

let b:browser_search_default_engine = 'pypi'

call init#init#rst#map()
call init#init#sphinx#set()
