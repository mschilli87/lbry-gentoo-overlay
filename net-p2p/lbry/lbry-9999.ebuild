# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="A fully decentralized network for distributing data"
HOMEPAGE="http://lbry.io/"
EGIT_REPO_URI="https://github.com/lbryio/${PN}.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	~dev-python/bitcoinrpc-0.1[${PYTHON_USEDEP}]
	dev-python/leveldb[${PYTHON_USEDEP}]
	dev-python/miniupnpc[${PYTHON_USEDEP}]
	dev-python/pycrypto[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4.2[${PYTHON_USEDEP}]
	dev-python/seccure[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	dev-python/twisted-core[${PYTHON_USEDEP}]
	dev-python/twisted-web[${PYTHON_USEDEP}]
	dev-python/txJSON-RPC[${PYTHON_USEDEP}]
	~dev-python/unqlite-0.2.0[${PYTHON_USEDEP}]
	dev-python/yapsy[${PYTHON_USEDEP}]
	net-misc/lbryum[${PYTHON_USEDEP}]
	"
DEPEND="
	${CDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
