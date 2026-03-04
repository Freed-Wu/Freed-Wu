function! init#init#python#echo(...) abort
  let l:word = substitute(init#parse(a:), ':$', '', '')
  execute 'pyx print(' . l:word . ')'
endfunction

function! init#init#python#execute(...) abort
  let l:line = init#parse(a:)
  execute 'pyx' l:line
endfunction

function! init#init#python#create_type_stub(...) abort
  let l:word = init#parse(a:)
  echo 'CocCommand pyright.createtypestub' l:word
endfunction

function! init#init#python#substitute() abort
  " vint: next-line -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
  %substitute/\m^\S/# &/g
  " vint: next-line -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
  %substitute/\m^# \%(>>>\\|\.\.\.\)\%( \\|$\)//g
endfunction
