function! init#fake#post_source() abort
  call fake#define('name', 'fake#int(1) ? fake#gen("male_name")'
        \ . ' : fake#gen("female_name")')
  call fake#define('fullname', 'fake#gen("name") . " " . fake#gen("surname")')
  call fake#define('email', 'tolower(substitute(printf("%s@%s.%s",'
        \ . 'fake#gen("name"),'
        \ . 'fake#gen("surname"),'
        \ . 'fake#gen("gtld")), "\\s", "-", "g"))')
  call fake#define('sentence', 'fake#capitalize('
        \ . 'join(map(range(fake#int(3,15)),"fake#gen(\"nonsense\")"))'
        \ . ' . fake#chars(1,"..............!?"))')
  call fake#define('paragraph', 'join(map(range(fake#int(3,10)),'
        \ . '"fake#gen(\"sentence\")"))')
  call fake#define('age', 'float2nr(floor(110 * fake#betapdf(1.0, 1.45)))')
endfunction
