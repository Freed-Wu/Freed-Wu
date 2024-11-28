call init#init#markdown#main()

if exists(':Markview') && get(b:, 'markview', 0) == 0
  Markview enable
  let b:markview = 1
endif
