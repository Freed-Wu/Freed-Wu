augroup init_filetype
  autocmd!
  " Binary {{{1 "
  autocmd BufNewFile,BufRead *.ihex setfiletype hex
  " 1}}} Binary "

  " Text {{{1 "
  autocmd BufNewFile,BufRead *.{synctex,rpt,fdb_latexmk,fls,blg,ilg,lock} setfiletype log
  autocmd BufNewFile,BufRead build.log setfiletype less
  autocmd BufNewFile,BufRead */doc/*.txt setfiletype help
  " 1}}} Text "

  " Sheet {{{1 "
  autocmd BufNewFile,BufRead *.dat setfiletype csv_whitespace
  " 1}}} Sheet "

  " Data_Exchange {{{1 "
  autocmd BufNewFile,BufRead *.conf setfiletype conf
  autocmd BufNewFile,BufRead *{gitignore,.snippet} setfiletype gitignore
  autocmd BufNewFile,BufRead .mysql_history setfiletype mysql
  autocmd BufNewFile,BufRead pip.conf,layman.conf,qt-settings,lang.dat,.nethackrc*,*astylerc,*.{editorconfig,trashinfo,nmconnection} setfiletype dosini
  autocmd BufNewFile,BufRead zathura-*,zathurarc*,wpa_supplicant*.conf,*{.ctags,doxyfile} setfiletype conf
  autocmd BufNewFile,BufRead *gitconfig setfiletype gitconfig
  autocmd BufNewFile,BufRead tags-*,*-tags setfiletype tags
  autocmd BufNewFile,BufRead *.jupyterlab-settings setfiletype jsonc
  autocmd BufNewFile,BufRead *.{sublime-project,vsconfig,jscsrc,jshintrc,plan,ccls,sublime-workspace,css.map} setfiletype json
  autocmd BufNewFile,BufRead *.{mdl,clang-format} setfiletype yaml
  autocmd BufNewFile,BufRead SumatraPDF-settings.txt,getmailrc,khard.conf,*.{opensslconf,qdocconf,eclipseproduct,DsnWrk,PrjPCB,PrjMbdStructure,PrjMbd,PrjMbdStructure,LIBPKG,OutJob,BomDoc,Harness,wspos,jlink,dni,pjt,mac,qws} setfiletype toml
  autocmd BufNewFile,BufRead *.{theme,desktop,cache,list,directory} setfiletype desktop
  autocmd BufNewFile,BufRead tesseract_opencl_profile_devices.dat,*.{inx,projectspec,xaml,pyproj,cof,stp} setfiletype xml
  " 1}}} Data_Exchange "

  " Mark_Up {{{1 "
  autocmd BufNewFile,BufRead tmux.conf set filetype=tmux
  autocmd BufNewFile,BufRead *.{def,pgf,nlo,nls,inp,out,thm,eps_tex,pygtex,pygstyle,clo,aux,brf,ind,toc,lot,lof,loe,nav,vrb,ins,tikz,bbx,cbx,beamer} setfiletype tex
  autocmd BufNewFile,BufRead *.{plg,django} setfiletype html
  autocmd BufNewFile,BufRead */_layouts/*.html setfiletype liquid
  autocmd BufNewFile,BufRead *.{ess,edje} setfiletype css
  autocmd BufNewFile,BufRead *.snippets setfiletype snippets
  " 1}}} Mark_Up "

  " Script {{{1 "
  autocmd BufNewFile,BufRead SConstruct setfiletype python
  autocmd BufNewFile,BufRead *.bats,.bash_history setfiletype bash
  autocmd BufNewFile,BufRead .zsh_history,*.zsh-theme setfiletype zsh
  autocmd BufNewFile,BufRead {.,}latexmkrc setfiletype perl
  autocmd BufNewFile,BufRead .netrwhist setfiletype vim
  autocmd BufNewFile,BufRead *.nut setfiletype squirrel
  autocmd BufNewFile,BufRead *.{jsfl,xs,xdc,bld,fe,edc,xtext} setfiletype javascript
  autocmd BufNewFile,BufRead persp-auto-save*,.spacemacs,places,recentf,savehist,Cask,*.{stamp,elc,eld} setfiletype lisp
  autocmd BufNewFile,BufRead  */quelpa/cache setfiletype lisp
  autocmd BufNewFile,BufRead *.lg4 setfiletype lingo
  autocmd BufNewFile,BufRead */R/* setfiletype r
  autocmd BufNewFile,BufRead .octave_hist,*.matlab setfiletype octave
  autocmd BufNewFile,BufRead *.{gnuplot,plt},.gnuplot_history setfiletype gnuplot
  autocmd BufNewFile,BufRead *.{xa,xbn,xn,xr,xu} setfiletype rpcgen
  autocmd BufNewFile,BufRead *.{qsf,qip} setfiletype tcl
  " 1}}} Script "

  " Simulate {{{1 "
  autocmd BufNewFile,BufRead *.{lib,net,cir} set filetype=spice
  autocmd BufNewFile,BufRead *.mif setfiletype ahdl
  autocmd BufNewFile,BufRead *.{vht,cmp} setfiletype vhdl
  autocmd BufNewFile,BufRead *.{vl,vlg,vt} setfiletype verilog
  " 1}}} Simulate "

  " Compile {{{1 "
  autocmd BufNewFile,BufRead */.cabal/config setfiletype haskell
  autocmd BufNewFile,BufRead */.git/config setfiletype gitconfig
  autocmd BufNewFile,BufRead */khal/config setfiletype toml
  autocmd BufNewFile,BufRead *.{icf,acg,68k,56k,isl} setfiletype asm
  autocmd BufNewFile,BufRead *.asm execute matchstr(getline(1), '\S')  ==# '*' ? 'set filetype=asmc54xx' : ''
  autocmd BufNewFile,BufRead *.{gel,yfx,qdoc,c.noindent,cc.noindent,rh,ver,cilk,gui} setfiletype c
  " 1}}} Compile "
augroup END
" ex: foldmethod=marker
