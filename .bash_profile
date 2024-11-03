# shellcheck shell=bash disable=SC2016,SC2154
# https://github.com/koalaman/shellcheck/issues/1845
# /etc/skel/.bash_profile

if [[ -f ~/.local/share/gentoo/startprefix ]] && [[ -z $EPREFIX ]] && [[ -z $ZSH_VERSION ]]; then
	# old bash source it will exit 255
	SHELL=zsh exec ~/.local/share/gentoo/startprefix
fi

# Add ~/.local/state/nix/profile/bin to $PATH
if [[ -f ~/.local/state/nix/profile/etc/profile.d/nix.sh ]]; then
	# shellcheck source=/dev/null
	. ~/.local/state/nix/profile/etc/profile.d/nix.sh
fi

# for tty
if [[ -f ~/.xprofile ]] && [[ -z $PYTHONSTARTUP ]]; then
	# shellcheck source=.xprofile
	. ~/.xprofile
fi

if [[ -f ~/.local/share/zinit/plugins/_pass/pass.sh ]]; then
	# shellcheck source=/dev/null
	. ~/.local/share/zinit/plugins/_pass/pass.sh
fi

if [[ -f ~/.local/share/zinit/plugins/_git/debmake.sh ]]; then
	# shellcheck source=/dev/null
	. ~/.local/share/zinit/plugins/_git/debmake.sh
fi

if [[ -f ~/.local/share/zinit/plugins/_perl/brew.sh ]]; then
	# shellcheck source=/dev/null
	. ~/.local/share/zinit/plugins/_perl/brew.sh
fi

# neomutt
export EMAIL="$DEBEMAIL"

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
	eval NIX_LD="$(~/script/nixos/get-NIX_LD.nix)"
	export NIX_LD_LIBRARY_PATH
	eval NIX_LD_LIBRARY_PATH="$(~/script/nixos/get-NIX_LD_LIBRARY_PATH.nix)"
	export GI_TYPELIB_PATH
	eval GI_TYPELIB_PATH="$(~/script/nixos/get-GI_TYPELIB_PATH.nix)"
	if has_cmd python; then
		PYTHONPATH="$HOME/.local/lib/python$(~/.config/python/python/__main__.py)/site-packages"
		export PYTHONPATH
	fi
	# pkg-config
	PKG_CONFIG_PATH="$PKG_CONFIG_PATH${PKG_CONFIG_PATH:+:}/run/current-system/sw/lib/pkgconfig:/run/current-system/sw/share/pkgconfig:$HOME/.local/state/nix/profile/lib/pkgconfig:$HOME/.local/state/nix/profile/share/pkgconfig"
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
	if has_cmd less; then
		version="$(less --version)" version=${version#less } version=${version%% *}
		if ((version > 600)); then
			MANPAGER='manpager | less --pattern=^\\S+'
		else
			MANPAGER='manpager | less'
		fi
		unset version
	else
		MANPAGER=manpager
	fi
	export MANPAGER
fi
# less
export LESS='-r -M -S -I --mouse'
# interactively
export FZF_HISTORY_DIR
if [[ $OSTYPE == msys ]] || [[ $OSTYPE == cygwin ]]; then
	FZF_HISTORY_DIR="$(cygpath -w "${XDG_DATA_HOME:-$HOME/.local/share}"/fzf | sed 's=\\=\\\\=g')"
else
	FZF_HISTORY_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fzf"
fi
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md#ripgrep-integration
# rg foo | fzf
# --preview-window=...,~4 will avoid ps's preview provided by fzf-tab
# -d$"\0"
export FZF_DEFAULT_OPTS="--history=$FZF_HISTORY_DIR/fzf.txt
--preview='bat --color=always --highlight-line={2} {1} 2> /dev/null || less {1}'
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
# brew
export HOMEBREW_BAT=true
export HOMEBREW_BOOTSNAP=true
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.bfsu.edu.cn/homebrew-bottles
export HOMEBREW_API_DOMAIN="$HOMEBREW_BOTTLE_DOMAIN/api"
export HOMEBREW_GIT_NAME="$DEBFULLNAME"
export HOMEBREW_GIT_EMAIL="$EMAIL"
export HOMEBREW_GITHUB_API_TOKEN="$HOMEBREW_GITHUB_PACKAGES_TOKEN"
# docker
export DOCKER_BUILDKIT=1
# repo
export REPO_URL=https://mirrors.bfsu.edu.cn/git/git-repo
# direnv
export DIRENV_LOG_FORMAT=
# minicom
export MINICOM=-w
# lua
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
# node
export NODE_ENV=development
if [[ -f /usr/share/fzf-tab-completion/node/fzf-node-completion.js ]]; then
	export NODE_OPTIONS='-r /usr/share/fzf-tab-completion/node/fzf-node-completion.js'
fi
if has_cmd node-prototype-repl; then
	NODE_REPL_EXTERNAL_MODULE="$(command -v node-prototype-repl)"
	export NODE_REPL_EXTERNAL_MODULE
fi
if [[ -z $TMUX_PANE && $TERM == tmux-256color ]]; then
	export TERM=xterm-256color
fi

# ccstudio
# DM6467 needs c6000-cgt < 8.0.0
compiler=c6000_7.4.24
# compiler=ti-cgt-c6000_8.3.12
dir="/opt/ccstudio/ccs/tools/compiler/$compiler"
if [[ -d $dir ]]; then
	C6X_C_DIR="$dir/include;$dir/lib"
	PATH="$PATH${PATH:+:}$dir/bin"
fi
unset dir compiler
export C6X_C_DIR
