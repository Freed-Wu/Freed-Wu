call vimtex#init()
call init#init#tex#main()

setlocal foldexpr=MatlabFoldExpr()
setlocal foldtext=MatlabFoldText()
let &l:path = '.,' . trim(system('octave-config -p DATAROOTDIR')) . '/octave/' . trim(system('octave-config -p VERSION')) . '/m/**2,'
let &l:path .= trim(system('octave-config --m-site-dir')) . '/**2'
if filereadable('.octave_packages')
  let s:list = readfile('.octave_packages')
  let s:i = 0
  let s:answer = match(s:list, '# name: dir', 0, s:i)
  while s:answer != -1
    let &l:path .= ',' . s:list[s:answer + 4] . '/**1'
    let s:i += 1
    let s:answer = match(s:list, '# name: dir', 0, s:i)
  endwhile
endif
