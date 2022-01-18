# all shells share share this file, so use bash syntax primarily
# paths must be loaded here
if (($+DOCKER_BUILDKIT)); then
  return
fi
if [[ -f ~/.xprofile ]] && ((! $+PYTHONSTARTUP)); then
  . ~/.xprofile
fi
# adb shell doesn't have $LANG
if [[ -z $LANG ]]; then
  export LANG=en_US.UTF-8
fi
if [[ $OSTYPE == linux-android ]]; then
  export PATH=$PATH:$HOME/bin:/system/bin:/system/xbin\
:/vendor/bin:/product/bin:/sbin
fi
# https://github.com/termux/termux-packages/issues/4781
if [[ $OSTYPE == linux-android ]]; then
  export MANPAGER=batman
elif (($+commands[col] && $+commands[bat])); then
  export MANPAGER="sh -c 'col -bx|bat -plman'"
fi
# tty
if [[ -n $DISPLAY ]]; then
  export BROWSER=xdg-open
else
  export BROWSER=w3m
fi
# windows's softwares are outdated
if [[ $OSTYPE != cygwin && $OSTYPE != msys2 ]]; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS="--history=${XDG_CACHE_HOME:-$HOME/.cache}/fzf.txt
  "'-m
  -d$"\0"
  --preview="less {+1}"
  --bind=tab:down
  --bind=btab:up
  --bind=alt-j:jump
  --bind=alt-k:kill-line
  --bind=ctrl-q:clear-query
  --bind=alt-a:first
  --bind=alt-e:last
  --bind=alt-N:toggle-in
  --bind=alt-P:toggle-out
  --bind=ctrl-space:toggle
  --bind=ctrl-o:toggle-all
  --bind=ctrl-g:deselect-all
  --bind=alt-g:select-all
  --bind=ctrl-s:toggle-search
  --bind=ctrl-\\:toggle-sort
  --bind=ctrl-^:toggle-preview-wrap
  --bind=ctrl-x:toggle-preview
  --bind=alt-p:preview-up
  --bind=alt-n:preview-down
  --bind=ctrl-v:preview-page-down
  --bind=alt-v:preview-page-up
  --bind=ctrl-r:preview-half-page-down
  --bind=alt-r:preview-half-page-up
  --bind=alt-\<:preview-top
  --bind=alt-\>:preview-bottom'
  export FZF_TMUX_HEIGHT=$((LINES/2))
fi
# user customize
if [[ -f ~/.bash_login ]]; then
  . ~/.bash_login
fi
# less
export LESS=--mouse
# brew
export HOMEBREW_BAT=true
export HOMEBREW_BOOTSNAP=true
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/linuxbrew-bottles
export HOMEBREW_GITHUB_API_TOKEN=$GITHUB_TOKEN
export HOMEBREW_GITHUB_PACKAGES_TOKEN=$GITHUB_TOKEN
export HOMEBREW_GITHUB_PACKAGES_USER=$GITHUB_USER
export HOMEBREW_GIT_EMAIL=$EMAIL
export HOMEBREW_GIT_NAME=$GITHUB_USER
# docker
export DOCKER_BUILDKIT=1
