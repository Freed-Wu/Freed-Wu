# shellcheck disable=all
# all shells share share this file, so use bash syntax primarily
# paths must be loaded here
if (($+DOCKER_BUILDKIT)); then
  return
fi
# Add some programs to $PATH
if [[ -f ~/.nix-profile/etc/profile.d/nix.sh ]]; then
  . ~/.nix-profile/etc/profile.d/nix.sh
fi
if [[ -f ~/.xprofile ]] && ((! $+PYTHONSTARTUP)); then
  . ~/.xprofile
fi
if [[ -f ~/.local/share/zinit/plugins/.pass/pass.sh ]] && ((! $+CODESTATS_API_KEY)); then
  . ~/.local/share/zinit/plugins/.pass/pass.sh
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
    export BROWSER='gio open'
  else
    export BROWSER=termux-open
  fi
elif (($+commands[col] && $+commands[bat])); then
  export MANPAGER="sh -c 'col -bx|bat -plman'"
fi
# less
export LESS='--mouse -I'
# interactively
export FZF_HISTORY_DIR
if (($+commands[cygpath])); then
  FZF_HISTORY_DIR="$(cygpath -w ${XDG_DATA_HOME:-$HOME/.cache}/fzf | sed 's=\\=\\\\=g')"
else
  FZF_HISTORY_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fzf"
fi
# fzf
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--history=$FZF_HISTORY_DIR/fzf.txt"
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
