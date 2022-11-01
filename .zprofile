# shellcheck disable=all
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
elif [[ -z $DISPLAY ]]; then
  export BROWSER=w3m
fi
if [[ $OSTYPE == linux-android ]]; then
  export PATH=$PATH:$HOME/bin:/system/bin:/system/xbin\
:/vendor/bin:/product/bin:/sbin
  # https://github.com/termux/termux-packages/issues/4781
  # android/alpine/bsd/darwin use mandoc not man-db
  export MANPAGER=batman
  if [[ -n $DISPLAY ]]; then
    export BROWSER=exo-open
  else
    export BROWSER=termux-open
  fi
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
if (($+commands[cygpath])); then
  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--history=$(cygpath -w ${XDG_CACHE_HOME:-$HOME/.cache}/fzf.txt | sed 's=\\=\\\\=g')"
else
  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--history=${XDG_CACHE_HOME:-$HOME/.cache}/fzf.txt"
fi
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
# direnv
export DIRENV_LOG_FORMAT=
