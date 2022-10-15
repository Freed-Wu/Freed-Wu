# shellcheck disable=all
# PluginManage {{{1 #
if ((! $+HOMEBREW_BAT)); then
  . ~/.zprofile
fi

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
if [[ -f $XDG_DATA_HOME/zinit/plugins/zinit/zinit.zsh ]]; then
  . $XDG_DATA_HOME/zinit/plugins/zinit/zinit.zsh
elif (($+commands[git])); then
  git clone --depth=1 https://github.com/zdharma-continuum/zinit \
    $XDG_DATA_HOME/zinit/plugins/zinit
  . $XDG_DATA_HOME/zinit/plugins/zinit/zinit.zsh
else
  return
fi

# cannot wait
ZPFX="$HOME/.local"
zinit id-as depth'1' null for zdharma-continuum/zinit

# brew add some paths which may contain tmux
zinit id-as'.brew' depth'1' \
  atclone'/home/linuxbrew/.linuxbrew/bin/brew shellenv > brew.sh
  zcompile *.sh' \
    if'[ -x /home/linuxbrew/.linuxbrew/bin/brew ]' \
  for zdharma-continuum/null

# tmux firstly avoid load ~/.zshrc twice
# exec tmux will met bug in android
# tmux on android and windows is slow because it cannot run in background
# don't run tmux on them
if [[ $OSTYPE == linux-gnu && $KITTY_WINDOW_ID == 1 ]] && ((! $+TMUX \
  && $+commands[tmux] && ! $+SSH_TTY && ! $+HOMEBREW_DEBUG_INSTALL)); then
  exec tmux new -As0
fi
# windows don't support screen
if [[ $OSTYPE == cygwin || $OSTYPE == msys ]] && (($+TMUX)); then
  export TERM=xterm-256color
fi

# must load it quickly
zinit id-as depth'1' for lljbash/zsh-renew-tmux-env

zinit id-as depth'1' for zdharma-continuum/z-a-bin-gem-node
# 1}}} PluginManage #

# StatusLine {{{1 #
# p10k cannot support any ice, see its README.md
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
zinit id-as depth'1' \
  if'[[ ! -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]' \
  for romkatv/powerlevel10k
if [[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
  . /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi
[[ ! -f ~/.p10k.zsh ]] || . ~/.p10k.zsh
# 1}}} StatusLine #

# Cursor {{{1 #
# add-surround in visual mode cannot be highlighted
MODE_CURSOR_VIINS='blinking bar'
MODE_CURSOR_REPLACE='blinking underline'
MODE_CURSOR_VICMD='blinking block'
MODE_CURSOR_SEARCH=underline
MODE_CURSOR_VISUAL=block
MODE_CURSOR_VLINE=bar
zinit id-as depth'1' wait lucid \
  atload'vim_mode_set_keymap $(vim-mode-initial-keymap)
  bindkey -Mvisual s add-surround
  bindkey -e' \
  for softmoth/zsh-vim-mode
# 1}}} Cursor #

# ChangeDirectory {{{1 #
zinit id-as depth'1' for mdumitru/last-working-dir
zinit id-as depth'1' wait lucid for RobSis/zsh-reentry-hook
# 1}}} ChangeDirectory #

# Default {{{1 #
typeset -F SECONDS
WORDCHARS=
READNULLCMD=bat
ZLE_RPROMPT_INDENT=0
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt autopushd
setopt chaselinks
setopt pushdignoredups
setopt cdsilent
setopt pushdsilent

setopt globstarshort
setopt magicequalsubst
setopt numericglobsort
setopt rematchpcre

setopt incappendhistory
setopt extendedhistory
setopt histignorespace
setopt histignorealldups
setopt histreduceblanks
setopt histverify

setopt noflowcontrol
setopt interactivecomments

# https://github.com/MenkeTechnologies/zsh-expand/issues/7
setopt rcquotes

zmodload zsh/pcre
autoload -Uz run-help
autoload -Uz zcalc
autoload -Uz zmv
# 1}}} Default #

# Hook {{{1 #
zinit id-as'.direnv' depth'1' wait lucid \
  atclone'direnv hook zsh > direnv.sh
  zcompile *.sh' \
  if'(($+commands[direnv]))' \
  for zdharma-continuum/null
zinit id-as'.pyenv' depth'1' wait lucid \
  atclone'pyenv init - > pyenv.sh
  zcompile *.sh' \
  if'(($+commands[pyenv]))' \
  for zdharma-continuum/null
zinit id-as depth'1' wait lucid for Freed-Wu/zsh-command-not-found
zinit id-as depth'1' wait lucid \
  atload'FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
$(fzf_sizer_preview_window_settings)"' \
  if'(($+commands[fzf] && $+commands[bc]))' \
  for bigH/auto-sized-fzf
# 1}}} Hook #

# Complete {{{1 #
if (( $+HOMEBREW_PREFIX )); then
  fpath+=$HOMEBREW_PREFIX/share/zsh/site-functions
# https://github.com/msys2/MSYS2-packages/issues/2997
elif (( $+MSYSTEM_PREFIX )); then
  fpath+=$MSYSTEM_PREFIX/share/zsh/site-functions
fi
autoload -Uz compinit && compinit

zinit id-as'.vivid' depth'1' wait lucid \
  atclone'echo "export LS_COLORS=\"$(vivid generate molokai)\"" > vivid.sh
  zcompile *.sh' \
  atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"' \
  if'(($+commands[vivid]))' \
  for zdharma-continuum/null
zstyle ':completion:*' list-separator ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' \
  'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' muttrc \
  ${XDG_CONFIG_HOME:-$HOME/.config}/neomutt/neomuttrc
zstyle ':completion:*' mail-directory ${XDG_CACHE_HOME:-$HOME/.cache}/neomutt
zstyle ':completion:*' word true
zstyle ':completion::complete:*' use-cache true
zstyle ':completion::complete:*' call-command true
zstyle ':completion:*:processes' command "ps -wu$USER -opid,user,comm"
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' option-stacking true
# work when fzf-tab is not installed
zstyle ':completion:*' menu select
# https://github.com/BurntSushi/ripgrep/pull/2196
zstyle ':completion:*' extra-verbose true

zinit id-as depth'1' wait lucid \
  if'(($+commands[fzf]))' \
  for Aloxaf/fzf-tab
# in .xprofile, LINES=0
# in .zprofile, $LINES is not correct
FZF_TMUX_HEIGHT=$((LINES - 1))
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:*' single-group prefix color header
zstyle ':fzf-tab:*' continuous-trigger 'ctrl-_'
zstyle ':fzf-tab:*' switch-group 'alt-,' 'alt-.'

zinit id-as depth'1' wait lucid \
  if'(($+commands[fzf]))' \
  for Freed-Wu/fzf-tab-source

zinit id-as depth'1' wait lucid pick'shell/pinyin-comp.zsh' sbin'pinyin-comp' \
  for petronny/pinyin-completion
# 1}}} Complete #

# Log {{{1 #
# must before suggest, see its README.md
zinit id-as depth'1' wait lucid from'gitlab' \
  if'(($+CODESTATS_API_KEY))' \
  for code-stats/code-stats-zsh
ZSH_WAKATIME_PROJECT_DETECTION=true
zinit id-as depth'1' wait lucid \
  if'(($+commands[wakatime]))' \
  for wbingli/zsh-wakatime
# 1}}} Log #

# Syntax {{{1 #
zinit id-as depth'1' wait lucid for zdharma-continuum/fast-syntax-highlighting
# 1}}} Syntax #

# Suggest {{{1 #
# must load before zsh-autosuggestions
zinit id-as depth'1' wait lucid \
  atload'bindkey "^[p" history-substring-search-up
  bindkey "^[n" history-substring-search-down
  bindkey -Mvicmd gk history-substring-search-up
  bindkey -Mvicmd gj history-substring-search-down
  bindkey -Mvicmd zk history-search-backward
  bindkey -Mvicmd zj history-search-forward' \
  for zsh-users/zsh-history-substring-search
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(end-of-line vi-end-of-line vi-add-eol)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(vi-find-next-char
  forward-char vi-forward-char forward-word emacs-forward-word
  vi-forward-word vi-forward-word-end vi-forward-blank-word
  vi-forward-blank-word-end vi-find-next-char vi-find-next-char-skip
)
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(yank yank-pop
  history-search-forward history-search-backward
  history-beginning-search-forward history-beginning-search-backward
  history-substring-search-up history-substring-search-down
  up-line-or-beginning-search down-line-or-beginning-search
  up-line-or-history down-line-or-history accept-line copy-earlier-word
  )
ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
  orig-\*
  beep
  run-help
  set-local-history
  which-command
  zle-\*
)
zinit id-as depth'1' wait lucid \
  atload'_zsh_autosuggest_start
  bindkey "^\\" autosuggest-toggle' \
  for zsh-users/zsh-autosuggestions
# 1}}} Suggest #

# HotKey {{{1 #
bindkey -e
bindkey "\x1b[13;2u" accept-line
bindkey -Mvicmd "\x1b[13;2u" accept-line
bindkey "\x1b[13;5u" accept-line
bindkey -Mvicmd "\x1b[13;5u" accept-line
bindkey ^Xh _complete_help
autoload -U edit-command-line && bindkey '^X^E' edit-command-line
bindkey ^U backward-kill-line
bindkey ^Q vi-quoted-insert
bindkey '^]' vi-find-next-char
bindkey '^[]' vi-find-prev-char
bindkey '^[W' copy-region-as-kill
bindkey '^[l' down-case-word
bindkey '^[' vi-cmd-mode
bindkey '^[i' expand-or-complete-prefix
bindkey -Mvicmd cc vi-change-whole-line
# cursor cannot display correctly after start zsh, quit neovim, switch tmux
# zinit id-as depth'1' wait lucid \
#   atload'bindkey -sMvisual s S
#   bindkey -e' \
#   for jeffreytse/zsh-vi-mode

zinit id-as depth'1' wait lucid \
  atload'bindkey -Mvisual Q exchange
  bindkey -Mvicmd Q exchange' \
  for okapia/zsh-viexchange
# tmux selectw will result in wrong cursor in insert mode
# and cannot work when bindkey -e
# zinit id-as depth'1' for jeffreytse/zsh-vi-mode
zinit id-as depth'1' wait lucid for zsh-vi-more/vi-increment
# conflict with zsh-system-clipboard
# zinit id-as depth'1' wait lucid \
  # atload'bindkey -Mvicmd " " vi-easy-motion' \
  # for IngoHeimbach/zsh-easy-motion
ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT=true
zinit id-as depth'1' wait lucid \
  if'(($+commands[xsel] || $+commands[xclip] || $+commands[wl-copy]))' \
  for kutsan/zsh-system-clipboard

zinit id-as depth'1' wait lucid \
  atload'bindkey "^[/" redo
  bindkey "^[y" yank-pop' \
  for zdharma-continuum/zsh-editing-workbench
zinit id-as depth'1' wait lucid for zdharma-continuum/zui
# https://github.com/zdharma-continuum/zsh-cmd-architect/pull/1
zinit id-as depth'1' wait lucid for Freed-Wu/zsh-cmd-architect
# https://github.com/joshskidmore/zsh-fzf-history-search/pull/20
ZSH_FZF_HISTORY_SEARCH_FZF_ARGS='+s +m -x -e --preview-window=hidden'
zinit id-as depth'1' wait lucid \
  if'(($+commands[fzf]))' \
  atload'bindkey -Mvicmd / fzf_history_seach' \
  for joshskidmore/zsh-fzf-history-search
EMOJI_FZF_BINDKEY=^X^I
zinit id-as depth'1' wait lucid \
  if'(($+commands[emoji-fzf] && $+commands[fzf]))' \
  for pschmitt/emoji-fzf.zsh
autoload -Uz replace-string
zle -N replace-regex replace-string
bindkey '^^' replace-regex
autoload -Uz narrow-to-region
zle -N narrow-to-region
bindkey -Mvicmd ' ' narrow-to-region
autoload -Uz transpose-lines
zle -N transpose-lines
bindkey '^[T' transpose-lines
# 1}}} HotKey #

# Insert {{{1 #
zinit id-as depth'1' wait lucid for MenkeTechnologies/zsh-expand
zinit id-as depth'1' wait lucid for hlissner/zsh-autopair
# 1}}} Insert #

# Colorize {{{1 #
zinit id-as depth'1' wait lucid for zpm-zsh/colorize
zinit id-as depth'1' wait lucid \
  if'(($+commands[mysql]))' \
  for zpm-zsh/mysql-colorize
# 1}}} Colorize #

# Function {{{1 #
# Tool {{{2 #
zinit id-as depth'1' wait lucid \
  if'(($+commands[xdg-open] || $+commands[open]))' \
  for sineto/web-search
# 2}}} Tool #
# 1}}} Function #

# Compatible {{{1 #
# after loading completions
zinit id-as depth'1' wait lucid for 3v1n0/zsh-bash-completions-fallback
alias mv='mv -i'
alias cp='cp -ri'
alias scp='scp -r'
alias rsync='rsync -avzP'
alias rm='rm -i'
alias rename='rename -i'
alias perl-rename='perl-rename -i'
alias mkdir='mkdir -p'
alias rmdir='rmdir -p'
if (($+commands[exa])); then
  alias ls='exa --icons --git -h'
  alias tree='exa --icons -T'
else
  alias ls='ls --color=auto -h'
fi
if (($+commands[bat])); then
  bat-help() {
    for opt in $@; do
      alias -g -- "$opt=\\$opt | bat -plhelp --paging=never"
    done
  }
  bat-help --help
  # man
  bat-help '-\?'
  # x264
  bat-help --longhelp --fullhelp
  # gnome
  bat-help --help-all --help-gapplication --help-gtk
  unfunction bat-help
fi
# 1}}} Compatible #

# Program {{{1 #
# https://github.com/msys2/MSYS2-packages/issues/2998
# PackageManage {{{2 #
zinit id-as depth'1' wait lucid as'null' sbin'apt-cyg' \
  if'[[ $OSTYPE == cygwin ]]' \
  for transcode-open/apt-cyg
# 2}}} PackageManage #

# Superuser {{{2 #
zinit id-as depth'1' wait lucid null sbin's/sudo' sbin's/su' \
  if'[[ $OSTYPE == cygwin || $OSTYPE == msys ]]' \
  for imachug/win-sudo
# 2}}} Superuser #

# Download {{{2 #
zinit id-as depth'1' wait lucid null sbin'bash/release/*' \
  if'((! $+commands[gsync] || ! $+commands[gupload] ))' \
  for labbots/google-drive-upload
zinit id-as depth'1' wait lucid null sbin'release/bash/*' \
  if'((! $+commands[gdl]))' \
  for Akianonymus/gdrive-downloader
# 2}}} Download #

# Tool {{{2 #
zinit id-as depth'1' wait lucid as'null' sbin'spark' \
  if'((! $+commands[spark]))' \
  for holman/spark
zinit id-as depth'1' wait lucid as'null' sbin'slugify' \
  if'((! $+commands[slugify]))' \
  for benlinton/slugify
zinit id-as depth'1' wait lucid as'null' sbin'ugit' sbin'git-undo' \
  if'((! $+commands[ugit] && $+commands[git] && $+commands[fzf]))' \
  for Bhupesh-V/ugit
zinit id-as depth'1' wait lucid as'null' sbin'hr' \
  atclone"gzip --to-stdout *.1 > $ZPFX/man/man1/hr.1.gz" \
  atpull"gzip --to-stdout *.1 > $ZPFX/man/man1/hr.1.gz" \
  if'((! $+commands[hr]))' \
  for LuRsT/hr
zinit id-as depth'1' wait lucid as'null' sbin'has' \
  if'((! $+commands[has]))' \
  for kdabir/has
# 2}}} Tool #
# 1}}} Program #
# ex: foldmethod=marker
