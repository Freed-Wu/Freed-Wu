call init#init#pandoc#main()

if exists(':Markview') && get(b:, 'markview', 0) == 0
  Markview enable
  let b:markview = 1
endif
