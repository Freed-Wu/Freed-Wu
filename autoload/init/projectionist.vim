function! init#projectionist#source() abort
  let g:projectionist_heuristics = {
        \ '*': {
          \ 'src/*.c': {
            \ 'alternate': 'inc/{}.h',
            \ },
            \ 'src/*.cpp': {
              \ 'alternate': 'inc/{}.h',
              \ },
              \ 'inc/*.h': {
                \ 'alternate': ['src/{}.c', 'src/{}.cpp'],
                \ },
                \ },
                \ }
endfunction
