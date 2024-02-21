" $VIMRUNTIME/lua/vim/filetype.lua
augroup init_filetype
  autocmd!
  " Text {{{1 "
  autocmd BufNewFile,BufRead *.dat setfiletype csv_whitespace
  autocmd BufNewFile,BufRead *.ihex setfiletype hex
  autocmd BufNewFile,BufRead tags-*,*-tags setfiletype tags
  autocmd BufNewFile,BufRead *.{synctex,rpt,fdb_latexmk,fls,blg,ilg} setfiletype log
  " 1}}} Text "

  " Data_Describe {{{1 "
  autocmd BufNewFile,BufRead .{docker,rg,fd,}ignore setfiletype gitignore
  autocmd BufNewFile,BufRead */.config/{lxqt,screengrab,pcmanfm-qt}/*.conf,mimeapps.list,setup.cfg,.coveragerc,bootstraprc,psprint.conf,sofficerc setfiletype dosini
  autocmd BufNewFile,BufRead */pacman.d/mirrorlist{,.*},MANIFEST.SKIP,*.dfl setfiletype conf
  autocmd BufNewFile,BufRead *.{jupyterlab-settings,sublime-{project,settings},vsconfig,jscsrc,jshintrc,plan,ccls,sublime-workspace,css.map,xci} setfiletype json
  autocmd BufNewFile,BufRead */.bundle/config,*.mplstyle,.clangd,.git,DESCRIPTION setfiletype yaml
  autocmd BufNewFile,BufRead *.{{x,l}pr,{x,s}pfm},fonts.conf,*/{dbus-1,conf.d}/*.conf,*.xcu setfiletype xml
  " 1}}} Data_Describe "

  " Template {{{1 "
  autocmd BufNewFile,BufRead */_layouts/*.html setfiletype liquid.html
  " 1}}} Template "

  " Mark_Up {{{1 "
  autocmd BufNewFile,BufRead *.{2type,3{type,head,const}} setfiletype nroff
  autocmd BufNewFile,BufRead */tex/latex/**.cfg,*.{def,pgf,nlo,nls,inp,out,thm,eps_tex,pygtex,pygstyle,clo,aux,brf,ind,toc,lot,lof,loe,nav,vrb,ins,tikz,bbx,cbx,beamer} setfiletype tex
  " 1}}} Mark_Up "

  " Script {{{1 "
  autocmd BufNewFile,BufRead *{.stsg,/.local/share/supertux2/config} setfiletype lisp
  autocmd BufNewFile,BufRead */ldscripts/*,*.{map,cmd} setfiletype ld
  autocmd BufNewFile,BufRead */{.,}shortcuts/*,.bash_history,*.la setfiletype sh
  autocmd BufNewFile,BufRead *.zsh-theme,*.zunit setfiletype zsh
  autocmd BufNewFile,BufRead .mysql_history setfiletype mysql
  autocmd BufNewFile,BufRead *.lg4 setfiletype lingo
  autocmd BufNewFile,BufRead */R/* setfiletype r
  autocmd BufNewFile,BufRead */octave/history,*.matlab setfiletype octave
  autocmd BufNewFile,BufRead *.{gnuplot,plt},.gnuplot_history setfiletype gnuplot
  autocmd BufNewFile,BufRead SConstruct setfiletype python
  autocmd BufNewFile,BufRead rock_manifest,config.ld,*.tlu setfiletype lua
  autocmd BufNewFile,BufRead .netrwhist,cgdbrc setfiletype vim
  " 1}}} Script "

  " Compile {{{1 "
  autocmd BufNewFile,BufRead *.{s,S,sa} setfiletype asm
  autocmd BufNewFile,BufRead *.mlir setfiletype mlir
  autocmd BufNewFile,BufRead *.llvm setfiletype llvm
  autocmd BufNewFile,BufRead *.cl setfiletype opencl
  autocmd BufNewFile,BufRead *.gel setfiletype c
  " 1}}} Compile "
augroup END
" ex: foldmethod=marker
