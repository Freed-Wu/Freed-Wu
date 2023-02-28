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
  autocmd BufNewFile,BufRead */.config/{lxqt,screengrab,pcmanfm-qt}/*.conf,mimeapps.list,setup.cfg,.coveragerc setfiletype dosini
  autocmd BufNewFile,BufRead */pacman.d/mirrorlist{,.*},MANIFEST.SKIP setfiletype conf
  autocmd BufNewFile,BufRead .SRCINFO setfiletype jproperties
  autocmd BufNewFile,BufRead *.{jupyterlab-settings,sublime-{project,settings},vsconfig,jscsrc,jshintrc,plan,ccls,sublime-workspace,css.map} setfiletype json
  autocmd BufNewFile,BufRead */.bundle/config,*.mplstyle setfiletype yaml
  " 1}}} Data_Describe "

  " Template {{{1 "
  autocmd BufNewFile,BufRead */_layouts/*.html setfiletype liquid
  " 1}}} Template "

  " Mark_Up {{{1 "
  autocmd BufNewFile,BufRead */doc/*.txt setfiletype help
  autocmd BufNewFile,BufRead */tex/latex/**.cfg,*.{def,pgf,nlo,nls,inp,out,thm,eps_tex,pygtex,pygstyle,clo,aux,brf,ind,toc,lot,lof,loe,nav,vrb,ins,tikz,bbx,cbx,beamer} setfiletype tex
  " 1}}} Mark_Up "

  " Script {{{1 "
  autocmd BufNewFile,BufRead *.bats,.bash_history setfiletype bash
  autocmd BufNewFile,BufRead *.zsh-theme,.zsh_history setfiletype zsh
  autocmd BufNewFile,BufRead .mysql_history setfiletype mysql
  autocmd BufNewFile,BufRead *.drv setfiletype nix
  autocmd BufNewFile,BufRead *.lg4 setfiletype lingo
  autocmd BufNewFile,BufRead */R/* setfiletype r
  autocmd BufNewFile,BufRead .octave_hist,*.matlab setfiletype octave
  autocmd BufNewFile,BufRead *.{gnuplot,plt},.gnuplot_history setfiletype gnuplot
  autocmd BufNewFile,BufRead SConstruct setfiletype python
  autocmd BufNewFile,BufRead *.tlu setfiletype lua
  autocmd BufNewFile,BufRead .netrwhist setfiletype vim
  " 1}}} Script "

  " Compile {{{1 "
  autocmd BufNewFile,BufRead *.cl setfiletype opencl
  " 1}}} Compile "
augroup END
" ex: foldmethod=marker
