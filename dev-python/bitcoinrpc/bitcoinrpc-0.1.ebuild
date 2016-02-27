# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Efficient JSON-RPC for Python"
HOMEPAGE="https://github.com/jgarzik/python-bitcoinrpc"
MyPN="python-${PN}"
MyP="${MyPN}-${PV}"
SRC_URI="mirror://pypi/${MyPN:0:1}/${MyPN}/${MyP}.tar.gz"

SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	${PYTHON_DEPS}
	"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MyP}"
