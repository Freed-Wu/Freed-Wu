# PluginManage {{{1 #
source ~/.zinit/plugins/zinit/zinit.zsh
# cannot wait
zinit id-as null for zdharma/zinit
# 1}}} PluginManage #

# Default {{{1 #
# must load firstly
zinit id-as for okuramasafumi/zsh-sensible
unsetopt autocd
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit
compinit
zinit id-as for mdumitru/last-working-dir
zinit id-as wait lucid for RobSis/zsh-reentry-hook
# 1}}} Default #

# StatusLine {{{1 #
zinit id-as \
	src"${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" \
	for romkatv/powerlevel10k
# p10k cannot support any ice, see its README.md
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# 1}}} StatusLine #

# Log {{{1 #
# must before suggest, see its README.md
zinit id-as wait lucid from'gitlab' for code-stats/code-stats-zsh
zinit id-as wait lucid for wbingli/zsh-wakatime
# 1}}} Log #

# Suggest {{{1 #
# must load before zsh-autosuggestions
zinit id-as wait lucid \
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
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(kill-line
	history-search-forward history-search-backward
	history-beginning-search-forward history-beginning-search-backward
	history-substring-search-up history-substring-search-down
	up-line-or-beginning-search down-line-or-beginning-search
	up-line-or-history down-line-or-history accept-line copy-earlier-word
	)
zinit id-as wait lucid \
	atload'_zsh_autosuggest_start' \
	for zsh-users/zsh-autosuggestions
# 1}}} Suggest #

# Syntax {{{1 #
zinit id-as wait lucid for zdharma/fast-syntax-highlighting
# 1}}} Syntax #

# HotKey {{{1 #
bindkey ^U backward-kill-line
bindkey ^G push-line
bindkey ^Q vi-quoted-insert
bindkey '^]' vi-find-next-char
bindkey '^[W' copy-region-as-kill
bindkey '^[l' down-case-word
bindkey '^[_' redo
bindkey ^O vi-cmd-mode
bindkey '^[' vi-cmd-mode
# visual cannot highlight
zinit id-as wait lucid \
	atload'vim_mode_set_keymap `vim-mode-initial-keymap`
	bindkey -e' \
	for softmoth/zsh-vim-mode
# tmux selectw will result in wrong cursor in insert mode
# and cannot work when bindkey -e
# zinit id-as for jeffreytse/zsh-vi-mode
zinit id-as wait lucid for zsh-vi-more/vi-increment
# conflict with zsh-system-clipboard
# zinit id-as wait lucid \
	# atload'bindkey -Mvicmd " " vi-easy-motion' \
	# for IngoHeimbach/zsh-easy-motion
zinit id-as wait lucid for kutsan/zsh-system-clipboard

zinit id-as wait lucid for psprint/zsh-editing-workbench
zinit id-as wait lucid for zdharma/zui
zinit id-as wait lucid for psprint/zsh-cmd-architect
zinit id-as wait lucid null \
	atload'autoload -Uz ~/.zinit/plugins/zsh-sed-sub/autoload/basicSedSub
	zle -N basicSedSub
	bindkey ^S basicSedSub' \
	for MenkeTechnologies/zsh-sed-sub
# 1}}} HotKey #

# Insert {{{1 #
zinit id-as wait lucid for MenkeTechnologies/zsh-expand
zinit id-as wait lucid for hlissner/zsh-autopair
# 1}}} Insert #

# Print {{{1 #
zinit id-as wait lucid for MichaelAquilina/zsh-emojis
zinit id-as wait lucid as'program' for LuRsT/hr
zinit id-as wait lucid for pfahlr/zsh_plugin_loremipsum
# 1}}} Print #

# Complete {{{1 #
zinit id-as wait lucid as'completion' \
	if'[[ -z $OSTYPE || $OSTYPE == linux-android ]]' \
	for zsh-users/zsh-completions
zinit id-as wait lucid \
	atclone'./setup.py install' \
	pick'shell/pinyin-comp.zsh' \
	if'[[ -n $OSTYPE && -x $commands[python2] ]]' \
		for petronny/pinyin-completion
# 1}}} Complete #

# Alias {{{1 #
if [[ -z $TMUX && -x $commands[tmux] ]]; then
	if [[ $OSTYPE == linux-android ]]; then
		tmux new -A
	else
		exec tmux new -A
	fi
fi
# see <https://github.com/termux/termux-packages/issues/4781>
if [[ $OSTYPE == linux-android && -x $commands[bat] && -x $commands[col] ]]
then
	batman(){col -bx < $1|bat -plman}
	export MANPAGER=batman
fi

alias mv='mv -i'
alias cp='cp -ri'
alias rm='rm -i'
alias ls='exa --icons --git'
alias tree='exa --icons --git -T'
if [[ $OSTYPE != linux-android ]]; then
	alias man='man -L zh_CN.utf8'
fi
alias pandoc='pandoc -s --pdf-engine=xelatex'
zinit id-as wait lucid for Tarrasch/zsh-command-not-found
# 1}}} Alias #

# FileManage {{{1 #
zinit id-as wait lucid for peterhurford/git-it-on.zsh
zinit id-as wait lucid as'program' for benliton/slugify
zinit id-as wait lucid as'program' for holman/spark
# 1}}} FileManage #

# Fuzzy {{{1 #
zinit id-as wait lucid \
	if'[[ -x $commands[fzf] ]]' \
	for Aloxaf/fzf-tab
zinit id-as wait lucid \
	if'[[ -x $commands[fzf] ]]' \
	for joshskidmore/zsh-fzf-history-search
zinit id-as wait lucid \
	if'[[ -x $commands[fzf] ]]' \
	for b4b4r07/enhancd
alias ...='__enhancd::cd ..'
zinit id-as wait lucid \
	if'[[ -x $commands[emoji-fzf] && -x $commands[fzf] ]]' \
	for pschmitt/emoji-fzf.zsh
zinit id-as wait lucid \
	if'[[ -x $commands[git] && -x $commands[fzf] ]]' \
	for wfxr/forgit
zinit id-as wait lucid \
	atclone'ln -s ~/.zinit/plugins/git-fuzzy/bin/git-fuzzy $ZPFX/bin' \
	if'[[ -x $commands[git] && -x $commands[fzf] ]]' \
	for bigH/git-fuzzy
zinit id-as wait lucid \
	if'[[ -x $commands[git] && -x $commands[fzf] ]]' \
	for Bhupesh-V/ugit
zinit id-as wait lucid \
	if'[[ -x $commands[systemctl] && -x $commands[fzf] ]]' \
	for NullSense/fuzzy-sys
zinit id-as wait lucid as'program' \
	if'[[ -x $commands[fd] && -x $commands[fzf] ]]' \
	for seifferth/cite
zinit id-as wait lucid \
	atclone'ln -s ~/.zinit/plugins/interactively/bin/interactively $ZPFX/bin' \
	if'[[ -x $commands[fzf] ]]' \
	for bigH/interactively
# 1}}} Fuzzy #

# Colorize {{{1 #
zinit id-as wait lucid for zpm-zsh/colorize
zinit id-as wait lucid for zpm-zsh/mysql-colorize
zinit id-as wait lucid \
	if'[[ -x commands[ack] ]]' \
	for paoloantinori/hhighlighter
# 1}}} Colorize #

# VirtualEnv {{{1 #
zinit id-as wait lucid pack for pyenv
zinit id-as wait lucid pick'nvm.sh' for nvm-sh/nvm
# 1}}} VirtualEnv #

# PackageManage {{{1 #
zinit id-as wait lucid as'program' \
	if'[[ $OSTYPE == cygwin ]]' \
		for transcode-open/apt-cyg
# 1}}} PackageManage #

# Tool {{{1 #
zinit id-as wait lucid as'program' for kdabir/has
zinit id-as wait lucid for sineto/web-search
zinit id-as wait lucid as'program' \
	atclone'cloudclip -i $GITHUB_TOKEN' \
	if'[[ -x $commands[python2] ]]' \
	for skywind3000/CloudClip
zinit id-as wait lucid \
	atclone'thefuck -a > fuck.sh
	direnv hook zsh > direnv.sh
	kitty +complete setup zsh > kitty.sh' \
	for zdharma/null
zinit id-as wait lucid null \
	if'[[ $OS == Windows ]]' \
	atclone'ln -s ~/.zinit/plugin/win-sudo/s/sudo $ZPFX/bin' \
	for imachug/win-sudo
zinit id-as wait lucid \
	if'[[ $OSTYPE == darwin ]]' \
	for zsh-users/zsh-apple-touchbar
zinit id-as wait lucid as'program' \
	if'[[ -x $commands[git] ]]' \
	for qw3rtman/git-fire
zinit id-as wait lucid as'program' for fakeNetflix/facebook-repo-PathPicker
zinit id-as wait lucid null \
	if'[[ -x $commands[vi] ]]' \
	atclone'python setup.py config
	python setup.py build
	python setup.py install --user' \
	for google/vimdoc
zinit id-as wait lucid as'program' pick'firepwned.py' \
	if'[[ -x $commands[firefox] ]]' \
	for christophetd/firepwned
zinit id-as wait lucid as'program' \
	if'[[ -x $commands[firefox] ]]' \
	for unode/firefox_decrypt
# 1}}} Tool #

# Compatible {{{1 #
zinit id-as wait lucid \
	atload'export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS `fzf_sizer_preview_window_settings`"' \
	if'[[ -x $commands[fzf] ]]' \
	for bigH/auto-sized-fzf
zinit id-as wait lucid \
	if'[[ $OSTYPE == darwin ]]' \
		for zackintosh/fixnumpad-osx.plugin.zsh
# after loading completions
zinit id-as wait lucid for 3v1n0/zsh-bash-completions-fallback
# use nvim completions not busybox vi
alias vi=nvim
# 1}}} Compatible #
