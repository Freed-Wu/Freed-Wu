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
elif [[ $OSTYPE == msys ]]; then
  export BROWSER=start
  export MSYS=winsymlinks:nativestrict
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
    export BROWSER=termux-open
  else
    export BROWSER=exo-open
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
