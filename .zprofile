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
