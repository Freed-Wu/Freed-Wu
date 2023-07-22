# shellcheck shell=bash source=/dev/null
# https://github.com/koalaman/shellcheck/issues/1845
# /etc/skel/.bash_profile
# adb shell doesn't have $LANG
if [[ -z $LANG ]]; then
	export LANG=en_US.UTF-8
fi
# tty
if [[ $OSTYPE == cygwin ]]; then
	export BROWSER=start
	export CYGWIN=winsymlinks:nativestrict
	export PATH="$PATH${PATH+:}/proc/cygdrive/c/cygwin"
elif [[ $OSTYPE == msys ]]; then
	export BROWSER=start
	export MSYS=winsymlinks:nativestrict
	export PATH="$PATH${PATH+:}/proc/cygdrive/c/msys64"
elif [[ $OSTYPE == darwin ]]; then
	export BROWSER=open
fi
if [[ $OSTYPE != msys2 ]]; then
	export PATH="$PATH${PATH+:}/${MINGW_ARCH:-mingw64}/bin"
fi
if [[ $OSTYPE == linux-android ]]; then
	PATH="$PATH${PATH+:}/system/bin:/system/xbin:/vendor/bin:/product/bin:/sbin"
	if [[ -n $DISPLAY ]]; then
		export BROWSER='gio open'
	else
		export BROWSER=termux-open
	fi
elif [[ -f /run/current-system/nixos-version ]]; then
	# python
	python_version=$(python --version)
	python_version=${python_version#* }
	python_version=${python_version%.*}
	PYTHONPATH="$HOME/.local/lib/python${python_version}/site-packages"
	unset python_version
	export PYTHONPATH
	PKG_CONFIG_PATH="$PKG_CONFIG_PATH${PKG_CONFIG_PATH+:}/run/current-system/sw/lib/pkgconfig:/run/current-system/sw/share/pkgconfig"
	export PKG_CONFIG_PATH
else
	PATH="$PATH${PATH+:}$HOME/.local/state/nix/profile/bin"
	PATH="$PATH${PATH+:}/opt/android-ndk/toolchains/llvm/prebuilt/$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)/bin"
	# https://aur.archlinux.org/packages/ccstudio#comment-906326
	PATH="$PATH${PATH+:}/opt/ccstudio/ccs/eclipse:/opt/ccstudio/ccs/ccs_base/common/uscif:/opt/ccstudio/ccs/ccs_base/scripting/bin"
fi
MANPAGER='manpager | less --pattern=^\\S+'
export MANPAGER
# ccstudio
C6X_C_OPTION=--issue_remarks
export C6X_C_OPTION
# less
export LESS='-r -M --mouse -S -I'
# interactively
export FZF_HISTORY_DIR
if [[ $OSTYPE == msys2 ]] || [[ $OSTYPE == cygwin ]]; then
	FZF_HISTORY_DIR="$(cygpath -w "${XDG_DATA_HOME:-$HOME/.cache}"/fzf | sed 's=\\=\\\\=g')"
else
	FZF_HISTORY_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fzf"
fi
# fzf
if [[ $OSTYPE == msys2 ]]; then
	devnull=nul
else
	devnull=/dev/null
fi
# rg foo | fzf
# $word = {2} make a wrong --preview-window
# https://github.com/Aloxaf/fzf-tab/issues/282
# -d$"\0"
export FZF_DEFAULT_OPTS="--preview='bat --color=always --highlight-line={2} {1}
2> $devnull || less {1}'
-m
-d:
--ansi
--reverse
--prompt='❯ '
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
--bind='ctrl-\\:toggle-sort'
--bind=ctrl-^:toggle-preview-wrap
--bind=ctrl-x:toggle-preview
--bind=alt-p:preview-up
--bind=alt-n:preview-down
--bind=ctrl-v:preview-page-down
--bind=alt-v:preview-page-up
--bind=ctrl-r:preview-half-page-down
--bind=alt-r:preview-half-page-up
--bind='alt-<:preview-top'
--bind='alt->:preview-bottom'
--bind='ctrl-]:change-preview-window(bottom|right)'
--bind='alt-space:change-preview-window(+{2}+3/3,~3|+{2}+3/3,~1|)'
--history=$FZF_HISTORY_DIR/fzf.txt"
unset devnull
if command -v auto-sized-fzf.sh &>/dev/null; then
	FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--preview-window=$(auto-sized-fzf.sh)"
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
# repo
export REPO_URL=https://mirrors.bfsu.edu.cn/git/git-repo
# direnv
export DIRENV_LOG_FORMAT=
# lua
version="$(lua -v)"
version=${version#* }
version=${version%% *}
version=${version%.*}
case $OSTYPE in
linux-*)
	ext=so
	;;
darwin)
	ext=dynlib
	;;
*)
	ext=dll
	;;
esac
export LUA_PATH="./share/lua/$version/?.lua;./?.lua;./?/init.lua;;$HOME/.local/share/lua/$version/?.lua;$HOME/.local/share/lua/$version/?/init.lua;$HOME/.local/state/nix/profile/share/lua/$version/?.lua;$HOME/.local/state/nix/profile/share/lua/$version/?/init.lua"
export LUA_CPATH="./lib/lua/$version/?.$ext;./?.$ext;./lib/lua/$version/loadall.$ext;;$HOME/.local/lib/lua/$version/?.$ext;$HOME/.local/state/nix/profile/lib/lua/$version/?.$ext"
if [[ -f /run/current-system/nixos-version ]]; then
	LUA_PATH="$LUA_PATH;/run/current-system/sw/share/lua/$version/?.lua;/run/current-system/sw/share/lua/$version/?/init.lua"
	LUA_CPATH="$LUA_CPATH;/run/current-system/sw/lib/lua/$version/?.$ext"
fi
unset version ext
