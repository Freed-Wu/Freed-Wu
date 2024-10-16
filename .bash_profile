# shellcheck shell=bash source=/dev/null disable=SC2016,SC2154
# https://github.com/koalaman/shellcheck/issues/1845
# /etc/skel/.bash_profile
has_cmd() {
	local opt
	for opt; do
		if command -v "$opt" >/dev/null; then
			continue
		else
			return $?
		fi
	done
}
# adb shell doesn't have $LANG
if [[ -z $LANG ]]; then
	export LANG=en_US.UTF-8
fi
# tty
if [[ $OSTYPE == cygwin ]]; then
	export BROWSER=start
	export CYGWIN=winsymlinks:nativestrict
	export PATH="$PATH${PATH:+:}/proc/cygdrive/c/cygwin"
elif [[ $OSTYPE == msys ]]; then
	export BROWSER=start
	export MSYS=winsymlinks:nativestrict
	export PATH="$PATH${PATH:+:}/proc/cygdrive/c/msys64"
elif [[ $OSTYPE == darwin* ]]; then
	export BROWSER=open
fi
if [[ $OSTYPE == linux-android ]]; then
	PATH="$PATH${PATH:+:}/system/bin:/system/xbin:/vendor/bin:/product/bin:/sbin:$HOME/.shortcuts:$HOME/bin"
	if [[ -n $DISPLAY ]] && has_cmd gio; then
		export BROWSER='gio open'
	else
		export BROWSER=termux-open
	fi
elif [[ -f /run/current-system/nixos-version ]]; then
	# https://blog.thalheim.io/2022/12/31/nix-ld-a-clean-solution-for-issues-with-pre-compiled-executables-on-nixos/
	export NIX_LD
	eval NIX_LD="$(~/script/get-NIX_LD.nix)"
	export NIX_LD_LIBRARY_PATH
	eval NIX_LD_LIBRARY_PATH="$(~/script/get-NIX_LD_LIBRARY_PATH.nix)"
	export GI_TYPELIB_PATH
	eval GI_TYPELIB_PATH="$(~/script/get-GI_TYPELIB_PATH.nix)"
	if has_cmd python; then
		PYTHONPATH="$HOME/.local/lib/python$(~/script/get-version.py)/site-packages"
		export PYTHONPATH
	fi
	PKG_CONFIG_PATH="$PKG_CONFIG_PATH${PKG_CONFIG_PATH:+:}/run/current-system/sw/lib/pkgconfig:/run/current-system/sw/share/pkgconfig"
	export PKG_CONFIG_PATH
else
	dir="/${MINGW_ARCH:-mingw64}/bin"
	if [[ $OSTYPE != msys && -d $dir ]]; then
		export PATH="$PATH${PATH:+:}$dir"
	fi
	dir=$HOME/.local/state/nix/profile/bin
	if [[ -d $dir ]]; then
		PATH="$PATH${PATH:+:}$dir"
	fi
	dir="/opt/android-ndk/toolchains/llvm/prebuilt/$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)/bin"
	if [[ -d $dir ]]; then
		PATH="$PATH${PATH:+:}$dir"
	fi
	dir=/opt/ccstudio/ccs
	# https://aur.archlinux.org/packages/ccstudio#comment-906326
	if [[ -d $dir ]]; then
		PATH="$PATH${PATH:+:}$dir/eclipse:$dir/ccs_base/common/uscif:$dir/ccs_base/scripting/bin"
	fi
	unset dir
fi
if has_cmd manpager; then
	MANPAGER='manpager | less --pattern=^\\S+'
	export MANPAGER
fi
# ccstudio
C6X_C_OPTION=--issue_remarks
export C6X_C_OPTION
# less
export LESS='-r -M --mouse -S -I'
# interactively
export FZF_HISTORY_DIR
if [[ $OSTYPE == msys ]] || [[ $OSTYPE == cygwin ]]; then
	FZF_HISTORY_DIR="$(cygpath -w "${XDG_DATA_HOME:-$HOME/.local/share}"/fzf | sed 's=\\=\\\\=g')"
else
	FZF_HISTORY_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fzf"
fi
# fzf
if has_cmd auto-sized-fzf.sh; then
	fzf_opt="$(auto-sized-fzf.sh)"
fi
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md#ripgrep-integration
# rg foo | fzf
# --preview-window=...,~4 will avoid ps's preview provided by fzf-tab
# -d$"\0"
export FZF_DEFAULT_OPTS="--history=$FZF_HISTORY_DIR/fzf.txt
--preview='bat --color=always --highlight-line={2} {1} 2> /dev/null || less {1}'
--preview-window=${fzf_opt:-right:50%},border-bottom,+{2}+4/4
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
--bind='alt-space:change-preview-window(+{2}+3/3,~3|+{2}+3/3,~1|)'"
unset fzf_opt
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
# minicom
export MINICOM=-w
if has_cmd git; then
	# neomutt
	EMAIL="$(git config --global user.email)"
	export EMAIL
	# debmake
	DEBFULLNAME="$(git config --global user.name)"
	export DEBFULLNAME
	DEBEMAIL="$EMAIL"
	export DEBEMAIL
fi
# lua
if has_cmd lua; then
	case $OSTYPE in
	linux-*)
		ext=so
		;;
	darwin*)
		ext=dynlib
		;;
	*)
		ext=dll
		;;
	esac
	for _version in '' 5.{1..4}; do
		version=${_version:-5.1}
		[ -z "$_version" ] || _version="_${_version//./_}"
		path_name="LUA_PATH$_version" cpath_name="LUA_CPATH$_version"
		export "$path_name"="./share/lua/$version/?.lua;./?.lua;./?/init.lua;;\
$HOME/.local/share/lua/$version/?.lua;\
$HOME/.local/share/lua/$version/?/init.lua;\
$HOME/.local/state/nix/profile/share/lua/$version/?.lua;\
$HOME/.local/state/nix/profile/share/lua/$version/?/init.lua"
		export "$cpath_name"="./lib/lua/$version/?.$ext;./?.$ext;\
./lib/lua/$version/loadall.$ext;;\
$HOME/.local/lib/lua/$version/?.$ext;\
$HOME/.local/state/nix/profile/lib/lua/$version/?.$ext"
		if [[ -f /run/current-system/nixos-version ]]; then
			eval "lua_path=\$$path_name" "lua_cpath=\$$cpath_name"
			export "$path_name"="$lua_path;/run/current-system/sw/share/lua/$version/?.lua;\
/run/current-system/sw/share/lua/$version/?/init.lua"
			export "$cpath_name"="$lua_cpath;/run/current-system/sw/lib/lua/$version/?.$ext"
			unset lua_path lua_cpath
		fi
	done
	unset version path_name cpath_name ext
fi
# node
export NODE_ENV=development
if [[ -f /usr/share/fzf-tab-completion/node/fzf-node-completion.js ]]; then
	export NODE_OPTIONS='-r /usr/share/fzf-tab-completion/node/fzf-node-completion.js'
fi
if has_cmd node-prototype-repl; then
	NODE_REPL_EXTERNAL_MODULE="$(command -v node-prototype-repl)"
	export NODE_REPL_EXTERNAL_MODULE
fi
# old bash doesn't support tmux-256color
if [[ -z $ZSH_VERSION && ${BASH_VERSION//.*/} -le 5 ]]; then
	export TERM=xterm-256color
	. ~/.bashrc
fi
