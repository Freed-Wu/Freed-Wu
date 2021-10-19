function! init#calendar#source() abort
  augroup init#calendar
    autocmd!
    " b:trailguide cannot be respected if `vi -cCalendar`
    autocmd Filetype calendar TrailGuide hide
  augroup END
endfunction
