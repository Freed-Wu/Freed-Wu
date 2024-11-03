# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="{% here %}"
HOMEPAGE="{{ g:snips_github }}/{{ expand('%:p:h:t') }}"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="$HOMEPAGE.git"
else
	SRC_URI="
		$HOMEPAGE/archive/${PV}.tar.gz -> $P.tar.gz
	"
	KEYWORDS="~amd64 ~arm64"
fi

LICENSE="GPL-3"
SLOT="0"

src_prepare() {
	default
	sed -i "s=/usr=$EPREFIX/usr=g" "$PN"
}

src_install() {
	dobin "$PN"
}
