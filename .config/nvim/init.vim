" Prefix {{{1 "
scriptencoding utf-8
if has('nvim')
  lua require"init"
endif
if get(g:, 'script_name', '') !=# ''
  set runtimepath-=~/.config/nvim
  finish
endif
if has('pythonx') && exists('$PYTHONSTARTUP')
  pyxfile $PYTHONSTARTUP
endif

" compatibility for vim
if exists('*stdpath')
  let $XDG_CONFIG_NVIM = stdpath('config')
  let $XDG_DATA_NVIM = stdpath('data')
  let $XDG_STATE_NVIM = has('nvim-0.8.0') ? stdpath('state') : $XDG_DATA_NVIM
  let $XDG_CACHE_NVIM = stdpath('cache')
else
  let s:expand = {var, default -> var == expand(var) ? expand(default) : var}
  let $XDG_CONFIG_NVIM = s:expand('$XDG_CONFIG_HOME/nvim', '$HOME/.config/nvim')
  let $XDG_DATA_NVIM = s:expand('$XDG_DATA_HOME/nvim', '$HOME/.local/share/nvim')
  let $XDG_STATE_NVIM = s:expand('$XDG_STATE_HOME/nvim', '$HOME/.local/state/nvim')
  let $XDG_CACHE_NVIM = s:expand('$XDG_CACHE_HOME/nvim', '$HOME/.cache/nvim')
endif
let $XDG_CONFIG_HOME = fnamemodify($XDG_CONFIG_NVIM, ':h')
let $XDG_DATA_HOME = fnamemodify($XDG_DATA_NVIM, ':h')
let $XDG_STATE_HOME = fnamemodify($XDG_STATE_NVIM, ':h')
let $XDG_CACHE_HOME = fnamemodify($XDG_CACHE_NVIM, ':h')
if !has('nvim')
  " vint: next-line -ProhibitSetNoCompatible
  set nocompatible
  set undodir=$XDG_STATE_NVIM/undo
  set directory=$XDG_STATE_NVIM/swap
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
  if !isdirectory(&directory)
    call mkdir(&directory, 'p')
  endif
endif
if has('gui_running')
  set guioptions=gtaAPd
  if has('win32') && !has('nvim')
    simalt ~x
  endif
endif
set spellfile=$XDG_STATE_NVIM/spell/en.utf-8.add
" firenvim use guifont although has('gui_running') == 0
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h
" set fontsize is smaller than terminal by 6
if hostname() ==# 'desktop'
  let &guifont .= '10'
" https://github.com/glacambre/firenvim/issues/1565
elseif hostname() ==# 'laptop'
  let &guifont .= '24'
else
  let &guifont .= '6'
endif
set belloff=
set modelines=2
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,default,cp936,latin1
set undofile
set confirm
set autowrite
set spelllang=en_us,cjk
set formatoptions+=rnlmB
set linebreak
set colorcolumn=+1
set nojoinspaces
set wrapscan
set ignorecase
set hlsearch
set showmatch
set foldmethod=syntax
set showcmd
set scrolloff=3
set virtualedit=block
set whichwrap+=h,l,<,>,~,[,]
set mouse=a
set fillchars=vert:\|,fold:…
set list
set listchars=tab:\┊\ ,extends:→,precedes:←,nbsp:+
set relativenumber
set number
set cursorline
set cursorcolumn
set lazyredraw
set shortmess+=Ic
set termguicolors
set wildcharm=<Tab>
set iminsert=0
set noshowmode
set hidden
set comments=
set expandtab
set tabstop=2
set shiftwidth=2
set nowritebackup
set updatetime=400
set textwidth=80
set background=dark
set titlestring=%<%F\ %{nerdfont#find()}%=%P%l/%L%c
set clipboard=unnamed
set guicursor=n-v-c-sm:block-Cursor/lCursor,i-ci-ve:ver25-CursorIM/lCursorIM,r-cr-o:hor20-CursorIM/lCursorIM
" call systemlist() will meet:
" /usr/bin/zsh: can''t open input files: /s
if &shell !~# 'cmd'
  set shellcmdflag=-c
endif
" unnamed clipboard of (n)vim only work in X11, see `:help unnamedplus`
if has('unnamedplus')
  set clipboard+=unnamedplus
endif
if exists('+makeencoding')
  set makeencoding=char
endif
set diffopt+=vertical,algorithm:patience
set signcolumn=number
if $PREFIX !=# '/data/data/com.termux/files/usr'
  set wildignorecase
endif
" &inccommand only exists on nvim
if exists('&inccommand')
  set inccommand=nosplit
endif
if executable('ps2pdf') && !has('nvim')
  set printexpr=system(join(['ps2pdf']+[v:fname_in])).delete(v:fname_in)+v:shell_error
endif
if executable('rg')
  set grepprg=rg\ -ni
endif
" https://github.com/vim/vim/issues/12683
highlight default link shebang Special
augroup Shebang
  autocmd!
  autocmd BufEnter * syntax match shebang /\%^#!.*$/ display
augroup END

let g:maplocalleader = ';'
let g:tex_flavor = 'latex'
let g:pandoc#filetypes#pandoc_markdown = 1
let g:filetype_m = 'octave'
let g:octave_use_matlab_end = 1
let g:load_doxygen_syntax = 1
let g:c_syntax_for_h = 1
let g:javaScript_fold = 1
let g:perl_fold = 1
let g:php_folding = 1
let g:r_syntax_folding = 1
let g:ruby_fold = 1
let g:sh_fold_enabled = 7
let g:zsh_fold_enable = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:python_highlight_all = 1
let g:readline_has_bash = 1
let g:yaml_schema = 'pyyaml'
let g:netrw_banner = 0
let g:netrw_liststyle= 3
let g:netrw_home = expand('$XDG_CACHE_NVIM/netrw')
let g:netrw_altfile = 1
let g:netrw_winsize = 30
if has('unix')
  let g:netrw_browsex_viewer = 'xdg-open'
endif

let g:html_ignore_conceal = 1
let g:html_dynamic_folds = 1
let g:html_expand_tabs = 1
let g:html_font = 'JetBrainsMono Nerd Font Mono'

" must before sensible because sensible will load matchit
let g:loaded_matchit = 1

" vim on linux will not start a server by default
if empty(v:servername) && exists('*remote_startserver') && has('clientserver')
  call remote_startserver('VIM')
endif

augroup init
  autocmd!
  autocmd VimResized * wincmd =
  autocmd QuickFixCmdPost lmake lwindow
  autocmd QuickFixCmdPost make cwindow
  if exists(':wshada')
    autocmd VimLeave * wshada!
  endif
augroup END

cnoremap <C-G> <C-U><C-H>

snoremap <C-B> <Left>
snoremap <C-F> <Right>
snoremap <C-N> <Down>
snoremap <C-P> <Up>
snoremap <C-A> <Home>
snoremap <C-E> <End>
snoremap <C-Y> <C-G>pgv<C-G>

nnoremap <silent> y<C-F>
      \ :<C-U>let @+ = join([expand('%'), line('.'), getline('.')], ':')<CR>
nnoremap <silent> y<C-L> :<C-U>let @+ = join([expand('%'), line('.')], ':')<CR>
nnoremap <silent> y<M-f>
      \ :<C-U>let @+ = join([expand('%:p'), line('.'), getline('.')], ':')<CR>
nnoremap <silent> y<M-l> :<C-U>let @+ = join([expand('%:p'), line('.')], ':')<CR>
nnoremap <silent> <2-LeftMouse> :call init#init#map#2leftmouse()<CR>
nnoremap <silent> <RightMouse> :call init#init#quickui#install('assets/json/context/normal/rightmenu/default.json')<CR>

nnoremap S ch
nnoremap s cl
xnoremap <silent> & :&<CR>
nnoremap Y y$
xnoremap Y $hy

nnoremap g<C-E> <C-Y>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
xnoremap <C-J> <C-W>j
xnoremap <C-K> <C-W>k
xnoremap <C-H> <C-W>h
xnoremap <C-L> <C-W>l
nnoremap [O {O<Esc>o
nnoremap ]O }O<Esc>o
xnoremap <silent> g& :&&<CR>
nnoremap <silent> <C-W>Q :<C-U>tabclose<CR>
nnoremap <silent> <C-W><C-F> :<C-U>tabfind <C-R><C-F><CR>
xnoremap <silent> <C-W><C-F> y:tabfind <C-R>0<CR>
nnoremap <silent> <C-W>C :tabclose<CR>
xnoremap <silent> <C-W>C :<C-U>tabclose<CR>
nnoremap <silent> <C-W>O :tabonly<CR>
xnoremap <silent> <C-W>O :<C-U>tabonly<CR>
nnoremap <silent> <C-W>( :tabmove -<CR>
nnoremap <silent> <C-W>) :tabmove +<CR>
xnoremap <silent> <C-W>( :<C-U>tabmove -<CR>
xnoremap <silent> <C-W>) :<C-U>tabmove +<CR>
nnoremap <silent> <C-W>{ :tabfirst<CR>
nnoremap <silent> <C-W>} :tablast<CR>
xnoremap <silent> <C-W>{ :<C-U>tabfirst<CR>
xnoremap <silent> <C-W>} :<C-U>tablast<CR>
nnoremap <silent> <C-W>m :vnew<CR>
nnoremap <silent> <C-W><Tab> :tabnew<CR>
xnoremap <silent> <C-W>m :vnew<CR>
xnoremap <silent> <C-W><Tab> :tabnew<CR>
nnoremap <silent> <C-W>e :<C-U>enew<CR>
xnoremap <silent> <C-W>e :<C-U>enew<CR>
nnoremap <silent> <C-W>S :sall<CR>
nnoremap <silent> <C-W>V :vertical sall<CR>
xnoremap <silent> <C-W>S :sall<CR>
xnoremap <silent> <C-W>V :vertical sall<CR>
nnoremap <silent> <C-W>a :qall<CR>
xnoremap <silent> <C-W>a :<C-U>qall<CR>
nnoremap <silent> <C-W>u :hide<CR>
xnoremap <silent> <C-W>u :<C-U>hide<CR>
nnoremap <silent> <C-W>U :unhide<CR>
xnoremap <silent> <C-W>U :<C-U>unhide<CR>
nnoremap <silent> zq :spellrare <C-R><C-A><CR>
nnoremap <silent> zQ :spellrare! <C-R><C-A><CR>
nnoremap zV zMzv
xnoremap zV zMzv
onoremap zV zMzv
nnoremap zJ zjzMzv
nnoremap zK zkzMzv
xnoremap zJ zjzMzv
xnoremap zK zkzMzv
onoremap zJ zjzMzv
onoremap zK zkzMzv
" 1}}} Prefix "

" PluginPrefix {{{1 "
" dein.nvim need
if !has('patch-8.2.000') && !has('nvim-0.8.0')
  finish
endif
set runtimepath+=$XDG_DATA_NVIM/repos/github.com/Shougo/dein.vim
if !filereadable(expand('$XDG_DATA_NVIM/repos/github.com/Shougo/dein.vim/autoload/dein.vim'))
  if executable('git')
    echo system(expand('git clone --depth=1 https://github.com/Shougo/dein.vim '
          \ . '$XDG_DATA_NVIM/repos/github.com/Shougo/dein.vim'))
  endif
  if !filereadable(expand('$XDG_DATA_NVIM/repos/github.com/Shougo/dein.vim/autoload/dein.vim'))
    finish
  endif
endif
let g:dein#cache_directory = $XDG_CACHE_NVIM
let g:dein#runtime_directory = expand('$XDG_DATA_NVIM/site/pack/dein/opt/_merged.vim')
let g:dein#enable_notification = 1
if executable('aria2c')
  let g:dein#download_command = 'aria2c'
endif
let s:prefix = getenv('PREFIX')
if s:prefix == v:null
  let s:sh = getenv('SHELL')
  if s:sh == v:null
    let s:sh = '/bin/sh'
  endif
  let s:prefix = fnamemodify(s:sh, ':h:h')
endif
" /usr merge: /usr/bin/sh -> /usr/share
" non /usr merge: /bin/sh -> /usr/share
" nix-shell: /nix/store/XXXX/bin/sh -> /run/current-system/sw/share
for s:prefix in [s:prefix, s:prefix . '/usr', '/run/current-system/sw']
  let s:path = s:prefix . '/share/icons/hicolor/128x128/apps/nvim.png'
  if filereadable(s:path)
    let g:dein#notification_icon = s:path
    break
  endif
endfor
let g:dein#types#git#clone_depth = 1
if dein#load_state(expand('$XDG_DATA_NVIM'))
  call dein#begin(expand('$XDG_DATA_NVIM'))
  " 1}}} PluginPrefix "

  " Plugin {{{1 "
  call dein#add(expand('$XDG_CONFIG_NVIM'), {
        \ 'frozen': 1,
        \ 'merged': 0,
        \ 'if': filereadable(expand('<sfile>:p:h')
        \ . '/autoload/init/init.vim'),
        \ 'hook_post_source': 'call init#init#post_source()',
        \ })
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('dstein64/vim-startuptime', {
        \ 'if': has('startuptime'),
        \ 'hook_source': 'call init#startuptime#source()',
        \ })
  " 1}}} Plugin "

  " Setting {{{1 "
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-sleuth')
  call dein#add('farmergreg/vim-lastplace')
  call dein#add('mox-mox/vim-localsearch', {
        \ 'hook_post_source': 'call init#localsearch#post_source()',
        \ })
  call dein#add('yianwillis/vimcdoc')
  call dein#add('mhinz/vim-hugefile')
  call dein#add('pbrisbin/vim-mkdir')
  call dein#add('roxma/vim-tmux-clipboard', {
        \ 'if': !empty('$TMUX'),
        \ })
  call dein#add('ConradIrwin/vim-bracketed-paste')
  call dein#add('airblade/vim-rooter', {
        \ 'hook_source': 'call init#rooter#source()',
        \ })
  " 1}}} Setting "

  " Log {{{1 "
  call dein#add('wakatime/vim-wakatime', {
        \ 'if': executable('wakatime-cli') && executable(
        \   expand('$HOME/.local/share/zinit/plugins/_pass/wakatime.sh')
        \ ),
        \ })
  " 1}}} Log "

  " UX {{{1 "
  call dein#add('liuchengxu/vim-which-key', {
        \ 'hook_source': 'call init#which_key#source()',
        \ 'hook_post_source': 'call init#which_key#post_source()',
        \ })
  call dein#add('skywind3000/vim-quickui', {
        \ 'if': exists('*nvim_open_win') || exists('*popup_create'),
        \ 'hook_source': 'call init#quickui#source()',
        \ 'hook_post_source': 'call init#quickui#post_source()',
        \ })
  call dein#add('lambdalisue/nerdfont.vim')
  call dein#add('mhinz/vim-startify', {
        \ 'hook_source': 'call init#startify#source()',
        \ })
  call dein#add('csch0/vim-startify-renderer-nerdfont')
  call dein#add('junegunn/vim-peekaboo')
  " 1}}} UX "

  " UI {{{1 "
  " Colorscheme {{{2 "
  call dein#add('flazz/vim-colorschemes')
  call dein#add('dracula/vim', {
        \ 'merged': 0,
        \ })
  call dein#add('jaredgorski/SpaceCamp')
  call dein#add('preservim/vim-thematic', {
        \ 'hook_source': 'call init#thematic#source()',
        \ })
  " 2}}} Colorscheme "

  " Transparent {{{2 "
  call dein#add('mattn/vimtweak', {
        \ 'if': has('gui_win32'),
        \ })
  call dein#add('mattn/transparency-windows-vim', {
        \ 'if': has('gui_win32'),
        \ })
  call dein#add('t9md/vim-macvim-transparency', {
        \ 'if': has('gui_mac'),
        \ })
  call dein#add('Kjwon15/vim-transparent', {
        \ 'if': !has('gui_running'),
        \ })
  " 2}}} Transparent "

  " StatusBar {{{2 "
  call dein#add('vim-airline/vim-airline', {
        \ 'hook_source': 'call init#airline#source()',
        \ })
  call dein#add('Freed-Wu/airline-renderer-nerdfont.vim')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('enricobacis/vim-airline-clock', {
        \ 'hook_source': 'call init#airline#clock#source()',
        \ })
  call dein#add('lambdalisue/battery.vim')
  call dein#add('lambdalisue/wifi.vim')
  " 2}}} StatusBar "

  " Sign {{{2 "
  call dein#add('kshenoy/vim-signature')
  call dein#add('mh21/errormarker.vim', {
        \ 'hook_source': 'call init#errormarker#source()',
        \ })
  call dein#add('osyo-manga/vim-anzu', {
        \ 'on_map': '<Plug>',
        \ 'hook_post_source': 'call init#anzu#post_source()',
        \ })
  call dein#add('mbbill/undotree', {
        \ 'hook_source': 'call init#undotree#source()',
        \ })
  " 2}}} Sign "

  " Font {{{2 "
  call dein#add('drmikehenry/vim-fontsize', {
        \ 'if': has('gui_running'),
        \ })
  " 2}}} Font "
  " 1}}} UI "

  " Filetype {{{1 "
  " Highlight {{{2 "
  call dein#add('lambdalisue/glyph-palette.vim', {
        \ 'hook_post_source': 'call init#glyph_palette#post_source()',
        \ })
  call dein#add('luochen1990/rainbow', {
        \ 'hook_source': 'call init#rainbow#source()',
        \ })
  call dein#add('vim-utils/vim-troll-stopper')
  call dein#add('Soares/trailguide.vim')
  call dein#add('Soares/longline.vim')
  " https://github.com/neoclide/coc-highlight/issues/36
  call dein#add('RRethy/vim-illuminate')
  call dein#add('dbmrq/vim-redacted', {
        \ 'hook_source': 'call init#redacted#source()',
        \ })
  " 2}}} Highlight "

  " Fold {{{2 "
  call dein#add('Konfekt/FastFold', {
        \ 'hook_source': 'call init#fastfold#source()',
        \ })
  call dein#add('embear/vim-foldsearch', {
        \ 'hook_source': 'call init#foldsearch#source()',
        \ })
  call dein#add('Konfekt/FoldText')
  call dein#add('pseewald/vim-anyfold', {
        \ 'on_cmd': 'AnyFoldActivate',
        \ })
  call dein#add('djoshea/vim-matlab-fold')
  call dein#add('thinca/vim-ft-help_fold')
  call dein#add('sgeb/vim-diff-fold')
  call dein#add('matcatc/vim-asciidoc-folding')
  " 2}}} Fold "

  " Conceal {{{2 "
  call dein#add('Freed-Wu/conceal.vim')
  call dein#add('Yggdroot/indentLine', {
        \ 'hook_source': 'call init#indentline#source()',
        \ })
  call dein#add('powerman/vim-plugin-AnsiEsc', {
        \ 'on_cmd': 'AnsiEsc',
        \ })
  " 2}}} Conceal "

  " Ftplugin {{{2 "
  call dein#add('Freed-Wu/sublime-syntax-language-server', {
        \ 'rev': 'release',
        \ })
  call dein#add('Freed-Wu/xilinx-language-server', {
        \ 'rev': 'release',
        \ })
  call dein#add('tpope/vim-dadbod')
  call dein#add('kristijanhusak/vim-dadbod-ui')
  " https://github.com/lervag/vimtex/issues/237
  call dein#add('lervag/vimtex', {
        \ 'merged': 0,
        \ 'hook_source': 'call init#vimtex#source()',
        \ })
  call dein#add('tpope/vim-scriptease', {
        \ 'hook_source': 'call init#scriptease#source()',
        \ })
  call dein#add('mechatroner/rainbow_csv', {
        \ 'hook_source': 'call init#rainbow_csv#source()',
        \ })
  " https://github.com/weirongxu/coc-markdown-preview-enhanced/issues/25
  call dein#add('iamcco/markdown-preview.nvim', {
        \ 'if': executable('npx'),
        \ 'hook_source': 'call init#markdown_preview#source()',
        \ 'on_ft': ['markdown', 'pandoc', 'rmd'],
        \ 'build': 'sh -c "cd app && npx --yes yarn install"'
        \ })
  " 2}}} Ftplugin "
  " 1}}} Filetype "

  " Hotkey {{{1 "
  " InsertCmdline {{{2 "
  call dein#add('tpope/vim-rsi')
  call dein#add('kana/vim-smartinput', {
        \ 'hook_source': 'call init#smartinput#source()',
        \ 'hook_post_source': 'call init#smartinput#post_source()',
        \ })
  " 2}}} InsertCmdline "

  " Abbreviate {{{2 "
  " if InsertEnter, modeline will be overridden
  call dein#add('tpope/vim-endwise')
  " 2}}} Abbreviate "

  " Scroll {{{2 "
  call dein#add('psliwka/vim-smoothie', {
        \ 'hook_source': 'call init#smoothie#source()',
        \ })
  call dein#add('preservim/vim-wheel')
  " 2}}} Scroll "

  " WindowMotion {{{2 "
  call dein#add('wesQ3/vim-windowswap', {
        \ 'hook_source': 'call init#windowswap#source()',
        \ })
  call dein#add('troydm/zoomwintab.vim', {
        \ 'hook_source': 'call init#zoomwintab#source()',
        \ })
  " 2}}} WindowMotion "

  " Repeat {{{2 "
  " https://github.com/kana/vim-repeat/issues/2
  call dein#add('kana/vim-repeat', {
        \ 'merged': 0,
        \ })
  call dein#add('inkarkat/vim-ingo-library')
  call dein#add('vim-scripts/visualrepeat')
  " 2}}} Repeat "

  " Operator {{{2 "
  call dein#add('dbmrq/vim-chalk', {
        \ 'hook_source': 'call init#chalk#source()',
        \ })
  call dein#add('tommcdo/vim-exchange', {
        \ 'on_map': {'n': '-', 'x': '-'},
        \ 'hook_source': 'call init#exchange#source()',
        \ })
  call dein#add('kana/vim-operator-user', {
        \ 'hook_post_source': 'call init#operator_user#post_source()',
        \ })
  call dein#add('kana/vim-grex', {
        \ 'hook_source': 'call init#grex#source()',
        \ })
  call dein#add('voldikss/vim-browser-search', {
        \ 'hook_source': 'call init#browser_search#source()',
        \ })
  call dein#add('drwx/calutil.vim')
  call dein#add('JikkuJose/vim-visincr')
  call dein#add('AndrewRadev/inline_edit.vim')
  call dein#add('LiquidFun/vim-comment-banners')
  call dein#add('tpope/vim-unimpaired', {
        \ 'on_map': {'n': ['yo', '[', ']', '>p', '<p', '=p', 'y<Space>']},
        \ 'hook_source': 'call init#unimpaired#source()',
        \ 'hook_post_source': 'call init#unimpaired#post_source()',
        \ })
  call dein#add('tommcdo/vim-express', {
        \ 'on_map': ['g:', 'g!'],
        \ 'hook_source': 'call init#express#source()',
        \ })
  call dein#add('tpope/vim-abolish', {
        \ 'on_map': 'cr',
        \ 'on_cmd': ['Abolish', 'S'],
        \ })
  call dein#add('svermeulen/vim-yoink', {
        \ 'hook_source': 'call init#yoink#source()',
        \ })
  call dein#add('svermeulen/vim-subversive', {
        \ 'hook_source': 'call init#subversive#source()',
        \ })
  call dein#add('tpope/vim-surround', {
        \ 'on_map': {'n': ['ds', 'cs', 'cS', 'ys', 'yS', 'yss', 'ySs', 'ySS'],
        \ 'x': ['s', 'S'],
        \ 'i': ['<C-G>s', '<C-G>S', '<C-S>'],
        \ },
        \ 'hook_source': 'call init#surround#source()',
        \ })
  call dein#add('junegunn/vim-easy-align', {
        \ 'on_map': 'gz',
        \ 'on_cmd': ['EasyAlign', 'LiveEasyAlign'],
        \ 'hook_source': 'call init#easy_align#source()',
        \ })
  call dein#add('dominikduda/vim_yank_with_context')
  " 2}}} Operator "

  " Search {{{2 "
  call dein#add('andymass/vim-matchup', {
        \ 'on_map': {'n': ['%', 'g%', 'z%'], 'x': ['%', 'g%', 'z%'],
        \ 'o': ['%', 'g%', 'z%', 'i%', 'a%']},
        \ 'hook_source': 'call init#matchup#source()',
        \ })
  call dein#add('luochen1990/select-and-search', {
        \ 'on_map': {'x': 'n'},
        \ 'hook_source': 'call init#select_and_search#source()',
        \ })
  " bug
  call dein#add('justinmk/vim-sneak', {
        \ 'on_map': {'n': ['f', 'F', 't', 'T'],
        \ 'o': ['f', 'F', 't', 'T', 'z', 'Z'],
        \ 'x': ['f', 'F', 't', 'T'],
        \ },
        \ 'hook_source': 'call init#sneak#source()',
        \ })
  call dein#add('haya14busa/vim-asterisk')
  call dein#add('haya14busa/is.vim', {
        \ 'hook_source': 'call init#is#source()',
        \ })
  call dein#add('easymotion/vim-easymotion', {
        \ 'hook_source': 'call init#easymotion#source()',
        \ })
  call dein#add('haya14busa/incsearch.vim', {
        \ 'hook_source': 'call init#incsearch#source()',
        \ })
  call dein#add('haya14busa/incsearch-fuzzy.vim')
  call dein#add('haya14busa/incsearch-easymotion.vim', {
        \ 'hook_source': 'call init#incsearch#easymotion#source()',
        \ })
  " https://github.com/mg979/vim-visual-multi/issues/188
  call dein#add('mg979/vim-visual-multi', {
        \ 'on_map': {'n': ['<Leader><Leader>', '<C-_>', 'gS'],
        \ 'x': ['<Leader><Leader>', '<C-_>']},
        \ 'hook_source': 'call init#visual_multi#source()',
        \ })
  " 2}}} Search "

  " Replace {{{2 "
  call dein#add('kurkale6ka/vim-swap', {
        \ 'hook_source': 'call init#swap#source()',
        \ })
  call dein#add('lambdalisue/reword.vim')
  call dein#add('tpope/vim-speeddating')
  " 2}}} Replace "

  " Snippet {{{2 "
  call dein#add('tkhren/vim-fake', {
        \ 'hook_post_source': 'call init#fake#post_source()',
        \ })
  call dein#add('honza/vim-snippets', {
        \ 'hook_source': 'call init#snippets#source()',
        \ })
  call dein#add('Freed-Wu/template.vim')
  call dein#add('mattn/emmet-vim', {
        \ 'hook_post_source': 'call init#emmet_vim#post_source()',
        \ })
  call dein#add('dhruvasagar/vim-table-mode', {
        \ 'hook_source': 'call init#table_mode#source()',
        \ })
  " 2}}} Snippet "
  " 1}}} Hotkey "

  " TextObject {{{1 "
  " TextObjChar {{{2 "
  call dein#add('tommcdo/vim-ninja-feet', {
        \ 'on_map': {'o': ['[i', ']i', '[a', ']a'], 'n': ['z[', 'z]']},
        \ })
  call dein#add('wellle/targets.vim', {
        \ 'hook_source': 'call init#targets#source()',
        \ })
  call dein#add('kana/vim-textobj-user')
  call dein#add('thinca/vim-textobj-between', {
        \ 'on_map': {'o': ['x', 'X'], 'x': ['x', 'X']},
        \ 'hook_source': 'call init#textobj#between#source()',
        \ })
  call dein#add('kana/vim-textobj-jabraces', {
        \ 'on_map': {'o': ['ij', 'aj'], 'x': ['ij', 'aj']},
        \ })
  call dein#add('preservim/vim-textobj-quote', {
        \ 'hook_source': 'call init#textobj#quote#source()',
        \ 'hook_post_source': 'call init#textobj#quote#post_source()',
        \ })
  call dein#add('preservim/vim-textobj-sentence', {
        \ 'hook_post_source': 'call init#textobj#sentence#post_source()',
        \ })
  call dein#add('whatyouhide/vim-textobj-xmlattr', {
        \ 'on_map': {'o': ['ix', 'ax'], 'x': ['ix', 'ax']},
        \ })
  " 2}}} TextObjChar "

  " TextObjSymbol {{{2 "
  call dein#add('kana/vim-textobj-entire', {
        \ 'on_map': {'o': ['i0', 'a0'], 'x': ['i0', 'a0']},
        \ 'hook_source': 'call init#textobj#entire#source()',
        \ })
  call dein#add('kana/vim-textobj-indent', {
        \ 'on_map': {'o': ['ii', 'ai', 'iI', 'aI'],
        \ 'x': ['ii', 'ai', 'iI', 'aI']},
        \ })
  call dein#add('glts/vim-textobj-indblock', {
        \ 'on_map': {'o': ['io', 'ao', 'iO', 'aO'],
        \ 'x': ['io', 'ao', 'iO', 'aO']},
        \ })
  call dein#add('kana/vim-textobj-line', {
        \ 'on_map': {'o': ['il', 'al'], 'x': ['il', 'al']},
        \ })
  call dein#add('rhysd/vim-textobj-continuous-line', {
        \ 'on_map': {'o': ['iL', 'aL'], 'x': ['iL', 'aL']},
        \ 'hook_post_source': 'call init#textobj#continuous_line#source()',
        \ })
  call dein#add('coderifous/textobj-word-column.vim', {
        \ 'on_map': {'o': ['i<Tab>', 'a<Tab>', 'i<S-Tab>', 'a<S-Tab>'],
        \ 'x': ['i<Tab>', 'a<Tab>', 'i<S-Tab>', 'a<S-Tab>']},
        \ 'hook_source': 'call init#textobj#word_column#source()',
        \ })
  call dein#add('saaguero/vim-textobj-pastedtext', {
        \ 'on_map': {'o': 'gb', 'x': 'gb', 'n': 'gb'},
        \ 'hook_source': 'call init#textobj#pastedtext#source()',
        \ })
  " 2}}} TextObjSymbol "

  " TextObjSyntax {{{2 "
  call dein#add('somini/vim-textobj-fold', {
        \ 'on_map': {'o': ['iz', 'az'], 'x': ['iz', 'az']},
        \ })
  call dein#add('kana/vim-textobj-syntax', {
        \ 'on_map': {'o': ['iy', 'ay'], 'x': ['iy', 'ay']},
        \ })
  call dein#add('glts/vim-textobj-comment', {
        \ 'on_map': {'o': ['ir', 'ar', 'aR'], 'x': ['ir', 'ar', 'aR']},
        \ 'hook_source': 'call init#textobj#comment#source()',
        \ })
  " 2}}} TextObjSyntax "

  " TextObjContent {{{2 "
  call dein#add('Julian/vim-textobj-variable-segment', {
        \ 'on_map': {'o': ['iv', 'av'], 'x': ['iv', 'av']},
        \ })
  call dein#add('Chun-Yang/vim-textobj-chunk', {
        \ 'on_map': {'o': ['iB', 'aB'], 'x': ['iB', 'aB']},
        \ 'hook_source': 'call init#textobj#chunk#source()',
        \ })
  call dein#add('rsrchboy/vim-textobj-heredocs', {
        \ 'on_map': {'o': ['iH', 'aH'], 'x': ['iH', 'aH']},
        \ })
  call dein#add('kana/vim-textobj-datetime', {
        \ 'on_map': {'o': ['iT', 'aT', 'iY', 'aY', 'iZ'],
        \ 'x': ['iT', 'aT', 'iY', 'aY', 'iZ']},
        \ 'hook_source': 'call init#textobj#datetime#source()',
        \ })
  call dein#add('paulhybryant/vim-textobj-path', {
        \ 'on_map': {'o': ['iA', 'aA', 'inA', 'anA'],
        \ 'x': ['iA', 'aA', 'inA', 'anA']},
        \ 'hook_source': 'call init#textobj#path#source()',
        \ })
  call dein#add('jceb/vim-textobj-uri', {
        \ 'on_map': {'o': ['iu', 'au'], 'x': ['iu', 'au']},
        \ 'hook_source': 'call init#textobj#uri#source()',
        \ })
  " 2}}} TextObjContent "

  " TextObjMarkUp {{{2 "
  call dein#add('kana/vim-textobj-diff', {
        \ 'on_ft': 'diff',
        \ 'hook_source': 'call init#textobj#diff#source()',
        \ })
  call dein#add('kana/vim-textobj-help')
  call dein#add('coachshea/vim-textobj-markdown', {
        \ 'hook_source': 'call init#textobj#markdown#source()',
        \ })
  call dein#add('rbonvall/vim-textobj-latex')
  " 2}}} TextObjMarkUp "
  " 1}}} TextObject "

  " Tool {{{1 "
  " PackageManager {{{2 "
  " neoclide/coc.nvim_release
  call dein#add('neoclide/coc.nvim', {
        \ 'if': executable('node'),
        \ 'merged': 0,
        \ 'rev': 'release',
        \ 'hook_source': 'call init#coc#source()',
        \ })
  " 2}}} PackageManager "

  " FileCMD {{{2 "
  call dein#add('tpope/vim-eunuch', {
        \ 'on_cmd': ['Delete', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir',
        \ 'Cfind', 'Clocate', 'Lfind', 'Llocate', 'Wall', 'SudoWrite',
        \ 'SudoEdit'],
        \ })
  call dein#add('AndrewRadev/tagalong.vim')
  " 2}}} FileCMD "

  " Debug {{{2 "
  call dein#add('preservim/vimux', {
        \ 'on_cmd': ['VimuxRunCommand', 'VimuxRunLastCommand', 'VimuxOpenRunner',
        \ 'VimuxZoomRunner', 'VimuxInspectRunner', 'VimuxScrollUpInspect',
        \ 'VimuxScrollDownInspect', 'VimuxCloseRunner', 'VimuxInterruptRunner',
        \ 'VimuxPromptCommand', 'VimuxClearTerminalScreen',
        \ 'VimuxClearRunnerHistory', 'VimuxTogglePane'],
        \ 'on_map': {'x': ['<S-CR>'], 'i': ['<S-CR>', '<M-U>', '<M-D>'],
        \ 'n': ['<S-CR>', 'g<S-CR>', 'z<S-CR>', '<M-CR>', '<M-U>', '<M-D>']},
        \ 'hook_source': 'call init#vimux#source()',
        \ })
  " 2}}} Debug "

  " Async {{{2 "
  call dein#add('skywind3000/asyncrun.vim', {
        \ 'on_cmd': ['AsyncRun', 'AsyncStop'],
        \ 'hook_source': 'call init#asyncrun#source()',
        \ })
  call dein#add('skywind3000/asynctasks.vim', {
        \ 'on_cmd': ['AsyncTask', 'AsyncTaskEdit', 'AsyncTaskList',
        \ 'AsyncTaskMacro', 'AsyncTaskProfile'],
        \ })
  " 2}}} Async "

  " VCS {{{2 "
  call dein#add('rhysd/committia.vim', {
        \ 'hook_source': 'call init#committia#source()',
        \ 'if': !has('win32'),
        \ })
  " 2}}} VCS "

  " File {{{2 "
  call dein#add('lambdalisue/fern.vim', {
        \ 'hook_source': 'call init#fern#source()',
        \ })
  call dein#add('lambdalisue/fern-ssh')
  call dein#add('lambdalisue/fern-hijack.vim')
  call dein#add('lambdalisue/fern-git-status.vim')
  call dein#add('lambdalisue/fern-mapping-git.vim')
  call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
  call dein#add('lambdalisue/fern-mapping-project-top.vim')
  call dein#add('lambdalisue/fern-mapping-quickfix.vim')
  call dein#add('lambdalisue/fern-mapping-mark-children.vim')
  call dein#add('yuki-yano/fern-preview.vim')
  " 2}}} File "
  " 1}}} Tool "

  call dein#end()
  call dein#save_state()
endif
call dein#call_hook('source')
call dein#call_hook('post_source')
" ex: foldmethod=marker path=.,$XDG_DATA_NVIM/repos/github.com,$XDG_DATA_NVIM/repos
