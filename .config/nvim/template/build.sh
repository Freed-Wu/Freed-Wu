# shellcheck shell=bash disable=SC2034
TERMUX_PKG_HOMEPAGE=https://github.com/
TERMUX_PKG_DESCRIPTION='
.!gh repo view --json description -q .description %HERE%
'
TERMUX_PKG_LICENSE=GPL-3.0
# _COMMIT=
TERMUX_PKG_MAINTAINER=@termux
TERMUX_PKG_VERSION=
.!curl -H 'Accept: application/vnd.github.v3+json' https://api.github.com/repos//releases/latest 2>/dev/null | jq -r .tag_name | sed s/^v//
TERMUX_PKG_SRCURL=$TERMUX_PKG_HOMEPAGE/archive/v$TERMUX_PKG_VERSION.tar.gz
# TERMUX_PKG_SRCURL=$TERMUX_PKG_HOMEPAGE.git
# TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_SHA256=0
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS=bash
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout "$_COMMIT"
	local version
	version="$(git log -1 --format=%cs | sed 's/-/./g')"
	if [ "$version" != "$TERMUX_PKG_VERSION" ]; then
		echo -n "ERROR: The specified version \"$TERMUX_PKG_VERSION\""
		echo " is different from what is expected to be: \"$version\""
		return 1
	fi
}

termux_step_make() {
	return
}

termux_step_make_install() {
	local bin
	bin="$(basename $TERMUX_PKG_HOMEPAGE)"
	install -D "$bin" -t "$TERMUX_PREFIX/bin"
	install -D "$bin.1" -t "$TERMUX_PREFIX/share/man/man1"
}
