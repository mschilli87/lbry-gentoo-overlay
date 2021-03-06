# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python bindings for leveldb database library"
HOMEPAGE="http://code.google.com/p/py-leveldb/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz -> py-${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	"
DEPEND="${RDEPEND}"
