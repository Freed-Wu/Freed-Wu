" Prefix {{{1 "
let $XDG_CONFIG_HOME = $HOME . '/.config'
let $XDG_DATA_HOME = $HOME . '/.local/share'
let $XDG_CACHE_HOME = $HOME . '/.cache'
if !has('nvim')
  set nocompatible
  set encoding=utf-8
  set undodir=$XDG_DATA_HOME/nvim/undo
  set directory=$XDG_DATA_HOME/nvim/swap
endif
scriptencoding utf-8
if has('gui_running')
  set guioptions=gtaAPd
  if has('win32')
    simalt ~x
  endif
endif
set runtimepath=$VIMRUNTIME
set runtimepath+=$XDG_DATA_HOME/nvim/repos/github.com/Shougo/dein.vim
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
set expandtab
set nowritebackup
set updatetime=400
set textwidth=80
set background=dark
set titlestring=%<%F\ %{nerdfont#find()}%=%P%l/%L%c
set clipboard=unnamed
" unnamed clipboard of (n)vim only work in X11, see `:help unnamedplus`
if has('unnamedplus')
  set clipboard+=unnamedplus
endif
if exists('+makeencoding')
  set makeencoding=char
endif
if has('nvim-0.5.0') || has('patch-8.1.1564')
  set diffopt+=vertical,algorithm:patience
  set signcolumn=number
endif
if $PREFIX !=# '/data/data/com.termux/files/usr'
  set wildignorecase
endif
" &inccommand only exists on nvim
if exists('&inccommand')
  set inccommand=nosplit
endif
if executable('ps2pdf')
  set printexpr=system(join(['ps2pdf']+[v:fname_in])).delete(v:fname_in)+v:shell_error
endif
if executable('rg')
  set grepprg=rg\ -ni
endif
let g:maplocalleader = ';'

let g:tex_flavor = 'latex'
let g:filetype_m = 'octave'
let g:asmsyntax = 'masm'
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

let g:netrw_banner = 0
let g:netrw_liststyle= 3
let g:netrw_home = $XDG_CACHE_HOME . '/nvim/netrw'
let g:netrw_nogx = 1
let g:netrw_altfile = 1
let g:netrw_winsize = 30
if has('unix')
  let g:netrw_browsex_viewer = 'xdg-open'
endif

let g:html_ignore_conceal = 1
let g:html_dynamic_folds = 1
let g:html_expand_tabs = 1
let g:html_font = 'JetBrainsMono Nerd Font Mono'

" linux's vim will not start a terminal by default
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

snoremap <C-B> <Left>
snoremap <C-F> <Right>
snoremap <C-N> <Down>
snoremap <C-P> <Up>
snoremap <C-A> <Home>
snoremap <C-E> <End>
snoremap <C-Y> <C-G>pgv<C-G>

nnoremap S ch
nnoremap s cl
xnoremap <silent> & :&<CR>
nnoremap Y y$
xnoremap Y $hy
" 1}}} Prefix "

" PluginPrefix {{{1 "
if has('nvim') && executable('nvim-notify') || executable('notify-send')
      \ || executable('osascript') || executable('terminal-notifier')
  let g:dein#enable_notification = 1
endif
if executable('aria2c')
  let g:dein#download_command = 'aria2c'
endif
let g:dein#install_github_api_token = $GITHUB_TOKEN
let g:dein#notification_icon =
      \ '/usr/share/icons/hicolor/128x128/apps/nvim.png'
let g:dein#types#git#clone_depth = 1
if !isdirectory($XDG_DATA_HOME . '/nvim/repos/github.com/Shougo/dein.vim')
  if executable('git')
    call system('git clone --depth=1 https://github.com/Shougo/dein.vim '
          \ . $XDG_DATA_HOME . '/nvim/repos/github.com/Shougo/dein.vim')
  else
    finish
  endif
endif
if dein#load_state($XDG_DATA_HOME . '/nvim')
  call dein#begin($XDG_DATA_HOME . '/nvim')
  " 1}}} PluginPrefix "

  " Plugin {{{1 "
  call dein#add($XDG_CONFIG_HOME . '/nvim', {
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
  call dein#add('neoclide/coc.nvim', {
        \ 'if': executable('node'),
        \ 'merged': 0,
        \ 'rev': 'release',
        \ 'hook_source': 'call init#coc#source()',
        \ })
  " 1}}} Plugin "

  " Setting {{{1 "
  " load before sensible because sensible will load matchit
  call dein#add('andymass/vim-matchup', {
        \ 'hook_source': 'call init#matchup#source()',
        \ })
  call dein#add('tpope/vim-sensible')
  call dein#add('farmergreg/vim-lastplace')
  call dein#add('mox-mox/vim-localsearch', {
        \ 'hook_post_source': 'call init#localsearch#post_source()',
        \ })
  call dein#add('glacambre/firenvim', {
        \ 'if': exists('##UIEnter')
        \ && $PREFIX !=# '/data/data/com.termux/files/usr',
        \ 'hook_post_update': 'call firenvim#install(0)',
        \ 'hook_source': 'call init#firenvim#source()',
        \ })
  call dein#add('Freed-Wu/vim-fencview', {
        \ 'if': has('iconv'),
        \ 'hook_source': 'call init#fencview#source()',
        \ })
  call dein#add('yianwillis/vimcdoc')
  call dein#add('mhinz/vim-hugefile')
  " dde don't support xkbswitch
  call dein#add('lyokha/vim-xkbswitch', {
        \ 'if': !empty($XDG_SESSION_DESKTOP)
        \ && $XDG_SESSION_DESKTOP !=# 'deepin' || has('mac') || has('win32'),
        \ 'hook_source': 'call init#xkbswitch#source()',
        \ })
  " if BufNewFile, augroup Templates will be loaded in next BufNewFile
  call dein#add('aperezdc/vim-template', {
        \ 'hook_source': 'call init#template#source()',
        \ })
  call dein#add('Shougo/echodoc.vim', {
        \ 'hook_source': 'call init#echodoc#source()',
        \ })
  call dein#add('pbrisbin/vim-mkdir')
  call dein#add('lambdalisue/suda.vim', {
        \ 'if': executable('sudo'),
        \ 'hook_source': 'call init#suda#source()',
        \ })
  call dein#add('tmux-plugins/vim-tmux-focus-events', {
        \ 'if': !has('nvim'),
        \ })
  call dein#add('roxma/vim-tmux-clipboard', {
        \ 'if': !empty('$TMUX'),
        \ })
  call dein#add('christianfosli/wsl-copy', {
        \ 'if': executable('wsl'),
        \ 'on_cmd': 'Wsly',
        \ })
  call dein#add('biosugar0/vim-popyank', {
        \ 'if': exists('*popup_create'),
        \ 'on_cmd': 'PopYank',
        \ })
  call dein#add('ConradIrwin/vim-bracketed-paste')
  " 1}}} Setting "

  " Log {{{1 "
  call dein#add('wakatime/vim-wakatime', {
        \ 'if': executable('wakatime'),
        \ })
  call dein#add('https://gitlab.com/code-stats/code-stats-vim', {
        \ 'hook_source': 'call init#code_stats#source()',
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
  call dein#add('ryanoasis/vim-devicons', {
        \ 'hook_source': 'call init#devicons#source()',
        \ })
  call dein#add('mhinz/vim-startify', {
        \ 'hook_source': 'call init#startify#source()',
        \ })
  call dein#add('junegunn/vim-peekaboo')
  " 1}}} UX "

  " UI {{{1 "
  " Colorscheme {{{2 "
  call dein#add('flazz/vim-colorschemes')
  call dein#add('dracula/vim')
  call dein#add('jaredgorski/SpaceCamp')
  call dein#add('preservim/vim-thematic', {
        \ 'hook_source': 'call init#thematic#source()',
        \ })
  call dein#add('Godlygeek/csapprox', {
        \ 'if': has('gui'),
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
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('mattn/webapi-vim', {
        \ 'if': executable('wget') || executable('curl'),
        \ })
  " error in android, so need manually copy ~/.cache/.weather
  call dein#add('Wildog/airline-weather.vim', {
        \ 'if': (executable('wget') || executable('curl'))
        \ && !empty($WEATHER_APPID) && !empty($WEATHER_AREA),
        \ 'hook_source': 'call init#airline#weather#source()',
        \ })
  call dein#add('Zuckonit/vim-airline-todo', {
        \ 'merged': 0,
        \ 'hook_source': 'call init#airline#todo#source()',
        \ })
  call dein#add('enricobacis/vim-airline-clock', {
        \ 'hook_source': 'call init#airline#clock#source()',
        \ })
  call dein#add('lambdalisue/battery.vim')
  call dein#add('lambdalisue/wifi.vim', {
        \ 'if': !has('unix') || has('unix') && exists('*trim'),
        \ })
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
  call dein#add('sheerun/vim-polyglot', {
        \ 'merged': 0,
        \ 'hook_source': 'call init#polyglot#source()',
        \ })
  " need ++once
  call dein#add('lambdalisue/glyph-palette.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ 'hook_post_source': 'call init#glyph_palette#post_source()',
        \ })
  call dein#add('luochen1990/rainbow', {
        \ 'hook_source': 'call init#rainbow#source()',
        \ })
  call dein#add('vim-utils/vim-troll-stopper')
  call dein#add('Soares/trailguide.vim')
  call dein#add('Soares/longline.vim')
  call dein#add('sakshamgupta05/vim-todo-highlight')
  " https://github.com/neoclide/coc-highlight/issues/
  " coc-highlight highlight.document cannot work
  call dein#add('dominikduda/vim_current_word', {
        \ 'hook_source': 'call init#vim_current_word#source()',
        \ })
  call dein#add('dbmrq/vim-redacted', {
        \ 'hook_source': 'call init#redacted#source()',
        \ })
  " https://github.com/neoclide/coc-yank/issues/36
  call dein#add('machakann/vim-highlightedyank')
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
  call dein#add('LucHermitte/lh-vim-lib', {
        \ 'on_ft': ['c', 'cpp', 'cs', 'java', 'arduino', 'objc', 'objcpp'],
        \ })
  call dein#add('LucHermitte/VimFold4C')
  call dein#add('djoshea/vim-matlab-fold')
  call dein#add('thinca/vim-ft-help_fold')
  call dein#add('vim-utils/vim-ruby-fold')
  call dein#add('pedrohdz/vim-yaml-folds')
  call dein#add('sgeb/vim-diff-fold')
  call dein#add('matcatc/vim-asciidoc-folding')
  " 2}}} Fold "

  " Indent {{{2 "
  call dein#add('editorconfig/editorconfig-vim')
  " 2}}} Indent "

  " Conceal {{{2 "
  call dein#add('Yggdroot/indentLine', {
        \ 'hook_source': 'call init#indentline#source()',
        \ })
  call dein#add('powerman/vim-plugin-AnsiEsc', {
        \ 'on_cmd': 'AnsiEsc',
        \ })
  " 2}}} Conceal "

  " Ftplugin {{{2 "
  " https://github.com/lervag/vimtex/issues/237
  call dein#add('lervag/vimtex', {
        \ 'merged': 0,
        \ 'hook_source': 'call init#vimtex#source()',
        \ })
  call dein#add('iamcco/markdown-preview.nvim', {
        \ 'if': executable('yarn'),
        \ 'build': 'sh -c "cd app && yarn install"',
        \ 'hook_source': 'call init#markdown_preview#source()'
        \ })
  call dein#add('vim-pandoc/vim-pandoc', {
        \ 'hook_source': 'call init#pandoc#source()',
        \ })
  call dein#add('vim-pandoc/vim-pandoc-syntax', {
        \ 'hook_source': 'call init#pandoc#syntax#source()',
        \ })
  call dein#add('vim-pandoc/vim-pandoc-after', {
        \ 'hook_source': 'call init#pandoc#after#source()',
        \ })
  call dein#add('liuchengxu/graphviz.vim')
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('tpope/vim-scriptease')
  call dein#add('mechatroner/rainbow_csv')
  call dein#add('cmcaine/vim-uci')
  " 2}}} Ftplugin "
  " 1}}} Filetype "

  " Hotkey {{{1 "
  " InsertCmdline {{{2 "
  call dein#add('tpope/vim-rsi', {
        \ 'on_event': ['InsertEnter', 'CmdlineEnter'],
        \ 'hook_post_source': 'call init#rsi#post_source()',
        \ })
  call dein#add('kana/vim-smartinput', {
        \ 'on_event': ['InsertEnter', 'CmdlineEnter'],
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
        \ 'on_map': {'n': 'Q', 'x': 'Q'},
        \ 'hook_source': 'call init#exchange#source()',
        \ })
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('kana/vim-operator-user', {
        \ 'hook_post_source': 'call init#operator_user#post_source()',
        \ })
  call dein#add('kana/vim-grex', {
        \ 'hook_source': 'call init#grex#source()',
        \ })
  call dein#add('tyru/caw.vim', {
        \ 'hook_source': 'call init#caw#source()',
        \ })
  call dein#add('voldikss/vim-browser-search', {
        \ 'hook_source': 'call init#browser_search#source()',
        \ })
  call dein#add('drwx/calutil.vim')
  call dein#add('JikkuJose/vim-visincr')
  call dein#add('chrisbra/NrrwRgn', {
        \ 'hook_source': 'call init#nrrwrgn#source()',
        \ })
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
  " 2}}} Operator "

  " Search {{{2 "
  call dein#add('luochen1990/select-and-search', {
        \ 'on_map': {'x': 'n'},
        \ 'hook_source': 'call init#select_and_search#source()',
        \ })
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
  call dein#add('mattn/emmet-vim')
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
        \ 'on_map': {'o': ['ii', 'ai', 'iI', 'aI'], 'x': ['ii', 'ai', 'iI', 'aI']},
        \ })
  call dein#add('glts/vim-textobj-indblock', {
        \ 'on_map': {'o': ['io', 'ao', 'iO', 'aO'], 'x': ['io', 'ao', 'iO', 'aO']},
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
  call dein#add('jasonlong/vim-textobj-css', {
        \ 'on_ft': 'css',
        \ })
  call dein#add('whatyouhide/vim-textobj-erb', {
        \ 'on_ft': 'erb',
        \ })
  " 2}}} TextObjMarkUp "

  " TextObjScript {{{2 "
  call dein#add('akiyan/vim-textobj-php', {
        \ 'on_ft': 'php',
        \ 'hook_source': 'call init#textobj#php#source()',
        \ })
  call dein#add('bps/vim-textobj-python', {
        \ 'hook_source': 'call init#textobj#python#source()',
        \ })
  call dein#add('vimtaku/vim-textobj-sigil', {
        \ 'on_ft': 'perl',
        \ 'hook_source': 'call init#textobj#sigil#source()',
        \ })
  call dein#add('tek/vim-textobj-ruby', {
        \ 'on_ft': 'ruby',
        \ 'hook_source': 'call init#textobj#ruby#source()',
        \ })
  " 2}}} TextObjScript "

  " TextObjCompile {{{2 "
  call dein#add('rhysd/libclang-vim')
  call dein#add('libclang-vim/vim-textobj-clang', {
        \ 'hook_source': 'call init#textobj#clang#source()',
        \ })
  call dein#add('andyl/vim-textobj-elixir', {
        \ 'on_ft': 'elixir',
        \ })
  call dein#add('adriaanzon/vim-textobj-blade-directive', {
        \ 'on_ft': 'blade',
        \ })
  " 2}}} TextObjCompile "
  " 1}}} TextObject "

  " Tool {{{1 "
  " FileCMD {{{2 "
  call dein#add('tpope/vim-eunuch', {
        \ 'on_cmd': ['Delete', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir',
        \ 'Cfind', 'Clocate', 'Lfind', 'Llocate', 'Wall', 'SudoWrite',
        \ 'SudoEdit'],
        \ })
  call dein#add('will133/vim-dirdiff', {
        \ 'on_cmd': 'DirDiff',
        \ })
  call dein#add('AndrewRadev/tagalong.vim')
  call dein#add('tpope/vim-projectionist', {
        \ 'hook_source': 'call init#projectionist#source()',
        \ })
  " 2}}} FileCMD "

  " Note {{{2 "
  call dein#add('itchyny/calendar.vim', {
        \ 'hook_source': 'call init#calendar#source()',
        \ })
  " 2}}} Note "

  " Debug {{{2 "
  call dein#add('preservim/vimux', {
        \ 'on_cmd': ['VimuxRunCommand', 'VimuxRunLastCommand', 'VimuxOpenRunner',
        \ 'VimuxZoomRunner', 'VimuxInspectRunner', 'VimuxScrollUpInspect',
        \ 'VimuxScrollDownInspect', 'VimuxCloseRunner', 'VimuxInterruptRunner',
        \ 'VimuxPromptCommand', 'VimuxClearTerminalScreen',
        \ 'VimuxClearRunnerHistory', 'VimuxTogglePane'],
        \ 'on_map': {'x': ['<C-CR>'], 'i': ['<C-CR>', '<M-U>', '<M-D>'],
        \ 'n': ['<C-CR>', 'g<C-CR>', 'z<C-CR>', '<M-CR>', '<M-U>', '<M-D>']},
        \ 'hook_source': 'call init#vimux#source()',
        \ })
  call dein#add('voldikss/vim-floaterm', {
        \ 'hook_source': 'call init#floaterm#source()',
        \ })
  call dein#add('puremourning/vimspector', {
        \ 'hook_source': 'call init#vimspector#source()',
        \ })
  " 2}}} Debug "

  " Tag {{{2 "
  call dein#add('ludovicchabant/vim-gutentags', {
        \ 'if': executable('ctags') || executable('cscope')
        \ || executable('gtags-cscope'),
        \ 'hook_source': 'call init#gutentags#source()',
        \ })
  call dein#add('liuchengxu/vista.vim', {
        \ 'hook_source': 'call init#vista#source()',
        \ })
  " 2}}} Tag "

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
        \ })
  call dein#add('lambdalisue/gina.vim', {
        \ 'hook_source': 'call init#gina#source()',
        \ 'hook_post_source': 'call init#gina#post_source()',
        \ })
  " 2}}} VCS "

  " File {{{2 "
  call dein#add('antoinemadec/FixCursorHold.nvim')
  " need ++nested, ++once
  call dein#add('lambdalisue/fern.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ 'hook_source': 'call init#fern#source()',
        \ })
  call dein#add('lambdalisue/fern-hijack.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ })
  call dein#add('lambdalisue/fern-git-status.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ })
  call dein#add('lambdalisue/fern-mapping-git.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ })
  call dein#add('lambdalisue/nerdfont.vim')
  call dein#add('lambdalisue/fern-renderer-nerdfont.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ })
  call dein#add('lambdalisue/fern-mapping-project-top.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ })
  call dein#add('lambdalisue/fern-mapping-quickfix.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ })
  call dein#add('lambdalisue/fern-mapping-mark-children.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ })
  call dein#add('yuki-yano/fern-preview.vim', {
        \ 'if': has('nvim-0.5.0') || has('patch-8.1.1564'),
        \ })
  " 2}}} File "
  " 1}}} Tool "

  call dein#end()
  call dein#save_state()
endif
call dein#call_hook('source')
call dein#call_hook('post_source')

if !exists('##CmdlineEnter')
  call dein#source(['vim-rsi', 'vim-smartinput'])
endif
" ex: foldmethod=marker path=.,$XDG_DATA_HOME/nvim/repos/github.com,$XDG_DATA_HOME/nvim/repos