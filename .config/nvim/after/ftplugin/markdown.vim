call init#init#markdown#main()

if exists(':Markview') && get(b:, 'markview', 0) == 0
  Markview enable
  let b:markview = 1
endif
" https://github.com/nvim-treesitter/nvim-treesitter-context/issues/594
if exists(':TSContextDisable')
  TSContextDisable
endif
