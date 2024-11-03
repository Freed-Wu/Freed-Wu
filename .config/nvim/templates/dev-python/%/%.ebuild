# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} pypy3 )
inherit distutils-r1 pypi

DESCRIPTION="{% here %}"
HOMEPAGE="
	{{ g:snips_github }}/{{ expand('%:p:h:t') }}
	https://pypi.org/project/{{ expand('%:p:h:t') }}
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/[${PYTHON_USEDEP}]
"
