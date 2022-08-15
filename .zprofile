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
# tty
if [[ $OSTYPE == cygwin ]]; then
  export BROWSER=start
  export CYGWIN=winsymlinks:nativestrict
  export PATH=$PATH:/proc/cygdrive/c/cygwin
elif [[ $OSTYPE == msys ]]; then
  export BROWSER=start
  export MSYS=winsymlinks:nativestrict
  export PATH=$PATH:/proc/cygdrive/c/msys64
elif [[ $OSTYPE == darwin ]]; then
  export BROWSER=open
elif [[ -n $DISPLAY ]]; then
  export BROWSER=xdg-open
else
  export BROWSER=w3m
fi
if [[ $OSTYPE == linux-android ]]; then
  export PATH=$PATH:$HOME/bin:/system/bin:/system/xbin\
:/vendor/bin:/product/bin:/sbin
  # https://github.com/termux/termux-packages/issues/4781
  export MANPAGER=batman
  if [[ -n $DISPLAY ]]; then
    export BROWSER=exo-open
  else
    export BROWSER=termux-open
  fi
  # ~/.local/share/zinit/plugins/zsh-bash-completions-fallback/bash-completions-getter.sh:36
  export ZSH_BASH_COMPLETIONS_FALLBACK_PATH=$PREFIX/share/bash-completion
elif (($+commands[col] && $+commands[bat])); then
  export MANPAGER="sh -c 'col -bx|bat -plman'"
fi
# user customize
if [[ -f ~/.bash_login ]]; then
  . ~/.bash_login
fi
# less
export LESS='--mouse -I'
# fzf
if [[ $OSTYPE == msys ]]; then
  export FZF_DEFAULT_OPTS="--history=$(cygpath -w ${XDG_CACHE_HOME:-$HOME/.cache}/fzf.txt|sed 's=\\=\\\\=g')
  --preview='bat --color=always --highlight-line={2} {1} 2> nul || less {1}'"
else
  export FZF_DEFAULT_OPTS="--history=${XDG_CACHE_HOME:-$HOME/.cache}/fzf.txt
  --preview='bat --color=always --highlight-line={2} {1} 2> /dev/null || less {1}'"
fi
# rg foo --color=always | fzf -d:
FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
-m
-d$"\0"
--ansi
--reverse
--prompt="❯ "
--pointer=❯
--marker=✓
--bind=tab:down
--bind=btab:up
--bind=ctrl-j:jump
--bind=ctrl-k:kill-line
--bind=ctrl-n:down
--bind=ctrl-p:up
--bind=alt-j:previous-history
--bind=alt-k:next-history
--bind=ctrl-q:clear-query
--bind=alt-a:first
--bind=alt-e:last
--bind=alt-N:toggle-out
--bind=alt-P:toggle-in
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
--bind="alt-<:preview-top"
--bind="alt->:preview-bottom"
--bind="ctrl-]:change-preview-window(bottom|right)"
'
# brew
export HOMEBREW_BAT=true
export HOMEBREW_BOOTSNAP=true
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.bfsu.edu.cn/homebrew-bottles
export HOMEBREW_GITHUB_API_TOKEN=$GITHUB_TOKEN
export HOMEBREW_GITHUB_PACKAGES_TOKEN=$GITHUB_TOKEN
export HOMEBREW_GITHUB_PACKAGES_USER=$GITHUB_USER
export HOMEBREW_GIT_EMAIL=$EMAIL
export HOMEBREW_GIT_NAME=$GITHUB_USER
# docker
export DOCKER_BUILDKIT=1
