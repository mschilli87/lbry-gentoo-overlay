# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="SECCURE compatible Elliptic Curve cryptography in Python"
HOMEPAGE="https://github.com/bwesterb/py-seccure"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz -> py-${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/gmpy-1.15:1[${PYTHON_USEDEP}]
	>=dev-python/pycrypto-2.6[${PYTHON_USEDEP}]
	>=dev-python/six-1.2[${PYTHON_USEDEP}]
	"
DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"

src_prepare() {
	# remove erroneous space in dependency specifier
	sed -e "s/\('gmpy >=.*,\) \(.*'\)/\1\2/" -i setup.py || die
}
