# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Python bindings for the UnQLite embedded NoSQL database"
HOMEPAGE="http://unqlite-python.readthedocs.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz -> ${PN}-python-${PV}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	"
DEPEND="
	${RDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]
	"

src_prepare() {

	# fix build error with string to long conversion
	epatch "${FILESDIR}"/${PN}-${PV}-long-conv.patch

}
