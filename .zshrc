# Prefix {{{1 #
if [[ -z $CODESTATS_API_KEY ]]; then
  . ~/.zprofile
fi

# tmux firstly avoid load ~/.zshrc again
# exec tmux will met bug in Android
if [[ -z $TMUX && -n $commands[tmux] ]]; then
  tmux new -A && exit
fi
# 1}}} Prefix #

# PluginManage {{{1 #
if [[ -f ~/.zinit/plugins/zinit/zinit.zsh ]]; then
  . ~/.zinit/plugins/zinit/zinit.zsh
elif [[ -n $commands[git] ]]; then
  git clone https://github.com/zdharma/zinit ~/.zinit/plugins/zinit
  . ~/.zinit/plugins/zinit/zinit.zsh
else
  return
fi
# cannot wait
zinit id-as depth'1' null for zdharma/zinit

# must load it quickly
zinit id-as depth'1' for lljbash/zsh-renew-tmux-env
# 1}}} PluginManage #

# StatusLine {{{1 #
# p10k cannot support any ice, see its README.md
zinit id-as depth'1' \
  src"${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" \
  if'[[ ! -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]' \
  for romkatv/powerlevel10k
if [[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
  . /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi
[[ ! -f ~/.p10k.zsh ]] || . ~/.p10k.zsh
# 1}}} StatusLine #

# Cursor {{{1 #
# add-surround in visual mode cannot be highlighted
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
setopt autopushd
setopt chaselinks
setopt pushdignoredups
setopt cdsilent

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

zmodload zsh/pcre
autoload -Uz run-help && unalias run-help
autoload -Uz zcalc
autoload -Uz zmv
# 1}}} Default #

# Complete {{{1 #
autoload -Uz compinit && compinit

# since now vivid doesn't be transplanted to android and windows
zinit id-as depth'1' null pack \
  if'[[ -z $commands[vivid] ]]' \
  for LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-separator ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' muttrc ${XDG_CONFIG_HOME:-$HOME/.config}/neomutt/neomuttrc
zstyle ':completion:*' mail-directory ${XDG_CACHE_HOME:-$HOME/.cache}/neomutt
zstyle ':completion:*' word true
zstyle ':completion::complete:*' use-cache true
zstyle ':completion::complete:*' call-command true
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:git-checkout:*' sort false

if [[ -f /usr/share/pinyin-completion/shell/pinyin-comp.zsh ]]; then
  . /usr/share/pinyin-completion/shell/pinyin-comp.zsh
fi

zinit id-as depth'1' wait lucid \
  if'[[ -n $commands[fzf] ]]' \
  for Aloxaf/fzf-tab
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:*' continuous-trigger 'ctrl-_'
zstyle ':fzf-tab:*' switch-group 'alt-,' 'alt-.'
zstyle ':fzf-tab:complete:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:user-expand:*' fzf-preview 'less ${(Q)word}'
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
zstyle ':fzf-tab:complete:systemctl-*' fzf-preview \
  'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':completion:*:processes' command \
  "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(\\|*/|)(kill|ps):argument-rest' fzf-preview \
  '[ "$group" = "process ID" ] && ps -p$word -wocmd --no-headers'
zstyle ':fzf-tab:complete:(\\|*/|)(kill|ps):argument-rest' fzf-flags \
  --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
  fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
  'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
  'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
  'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
  'case "$group" in
  "commit tag") git show --color=always $word ;;
  *) git show --color=always $word | delta ;;
  esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
  'case "$group" in
  "modified file") git diff $word | delta ;;
  "recent commit object name") git show --color=always $word | delta ;;
  *) git log --color=always $word ;;
  esac'

zinit id-as depth'1' wait lucid as'completion' \
  if'[[ ! -d /usr/share/zsh/site-functions ]]' \
  for zsh-users/zsh-completions
# 1}}} Complete #

# Log {{{1 #
# must before suggest, see its README.md
zinit id-as depth'1' wait lucid from'gitlab' for code-stats/code-stats-zsh
zinit id-as depth'1' wait lucid \
  if'[[ -n $commands[wakatime] ]]' \
  for wbingli/zsh-wakatime
# 1}}} Log #

# Syntax {{{1 #
zinit id-as depth'1' wait lucid \
  atload'autoload -U edit-command-line && bindkey "^X^E" edit-command-line' \
  for zdharma/fast-syntax-highlighting
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
zinit id-as depth'1' wait lucid \
  if'[[ $OSTYPE != cygwin && $OSTYPE != msys2 ]]' \
  for kutsan/zsh-system-clipboard

zinit id-as depth'1' wait lucid \
  atload'bindkey "^[/" redo
  bindkey "^[y" yank-pop' \
  for psprint/zsh-editing-workbench
zinit id-as depth'1' wait lucid for zdharma/zui
zinit id-as depth'1' wait lucid for psprint/zsh-cmd-architect
zinit id-as depth'1' wait lucid \
  if'[[ -n $commands[fzf] ]]' \
  atload'bindkey -Mvicmd / fzf_history_seach' \
  for joshskidmore/zsh-fzf-history-search
zinit id-as depth'1' wait lucid \
  if'[[ -n $commands[emoji-fzf] && -n $commands[fzf] ]]' \
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
# android's ip from termux-tools is old
zinit id-as depth'1' wait lucid \
  atload'unfunction diff' \
  for zpm-zsh/colorize
zinit id-as depth'1' wait lucid \
  if'[[ -n $commands[mysql] ]]' \
  for zpm-zsh/mysql-colorize
# 1}}} Colorize #

# Function {{{1 #
# VirtualEnv {{{2 #
zinit id-as depth'1' wait lucid \
  if'[[ ! -f /usr/share/nvm/init-nvm.sh ]]' \
  for nvm-sh/nvm
# 2}}} VirtualEnv #

# Tool {{{2 #
zinit id-as depth'1' wait lucid for sineto/web-search
# 2}}} Tool #
# 1}}} Function #

# Compatible {{{1 #
zinit id-as depth'1' wait lucid \
  atclone'direnv hook zsh > direnv.sh' \
  for zdharma/null
zinit id-as depth'1' wait lucid for Tarrasch/zsh-command-not-found
# window's fzf is too old
zinit id-as depth'1' wait lucid \
  atload'FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS $(fzf_sizer_preview_window_settings)"' \
  if'[[ $OSTYPE != cygwin && $OSTYPE != msys2 && -n $commands[fzf] && -n $commands[bc] ]]' \
  for bigH/auto-sized-fzf
compdef _vim vi
# after loading completions
# android's zsh don't have bashcompinit
zinit id-as depth'1' wait lucid \
  if'[[ $OSTYPE != linux-android ]]' \
  for 3v1n0/zsh-bash-completions-fallback
export GPG_TTY=$(tty)
alias mv='mv -i'
alias cp='cp -ri'
alias rm='rm -i'
alias rename='rename -i'
if [[ $OSTYPE != cygwin && $OSTYPE != msys2 ]]; then
  alias ls='exa --icons'
  alias vdir='exa --icons --git -lh'
fi
if [[ $OSTYPE != linux-android ]]; then
  alias man='man -L zh_CN.UTF-8'
fi
# 1}}} Compatible #

# Program {{{1 #
# PackageManage {{{2 #
zinit id-as depth'1' wait lucid as'program' \
  if'[[ $OSTYPE == cygwin ]]' \
  for transcode-open/apt-cyg
# 2}}} PackageManage #

# Superuser {{{2 #
zinit id-as depth'1' wait lucid null \
  if'[[ $OSTYPE == cygwin || $OSTYPE == msys2 ]]' \
  atclone'ln -s ~/.zinit/plugin/win-sudo/s/* $ZPFX/bin' \
  for imachug/win-sudo
# 2}}} Superuser #

# VirtualEnv {{{2 #
zinit id-as depth'1' wait lucid null pack \
  if'[[ -z $commands[pyenv] ]]' \
  for pyenv
# 2}}} VirtualEnv #

# Download {{{2 #
zinit id-as depth'1' wait lucid null \
  atclone'./install.sh' \
  for labbots/google-drive-upload
zinit id-as depth'1' wait lucid null \
  atclone'./install.sh' \
  for Akianonymus/gdrive-downloader
# 2}}} Download #

# Tool {{{2 #
zinit id-as depth'1' wait lucid as'program' for LuRsT/hr
zinit id-as depth'1' wait lucid as'program' for holman/spark
zinit id-as depth'1' wait lucid as'program' for benlinton/slugify
zinit id-as depth'1' wait lucid as'program' \
  if'[[ -n $commands[rg] ]]' \
  for Freed-Wu/hhighlighter-rg
zinit id-as depth'1' wait lucid as'program' \
  if'[[ -n $commands[git] && -n $commands[fzf] ]]' \
  for Bhupesh-V/ugit
zinit id-as depth'1' wait lucid as'program' \
  if'[[ -z $commands[has] ]]' \
  for kdabir/has
zinit id-as depth'1' wait lucid null \
  if'[[ -z $commands[vimdoc] ]]' \
  atclone'setup.py config
  setup.py build
  setup.py install --user' \
  for google/vimdoc
# 2}}} Tool #
# 1}}} Program #
# ex: foldmethod=marker path=.,~/.zinit/plugins
