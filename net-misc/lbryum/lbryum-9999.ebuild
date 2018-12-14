# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="ncurses?"

inherit eutils distutils-r1 git-r3

DESCRIPTION="a lightweight client for lbrycrd"
HOMEPAGE="http://lbry.io/"
EGIT_REPO_URI="https://github.com/lbryio/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="cli ncurses qrcode +qt4"

REQUIRED_USE="
	|| ( cli ncurses qt4 )
	qrcode? ( qt4 )
"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/ecdsa-0.9[${PYTHON_USEDEP}]
	dev-python/jsonrpclib[${PYTHON_USEDEP}]
	dev-python/pbkdf2[${PYTHON_USEDEP}]
	dev-python/qrcode[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/slowaes-0.1[${PYTHON_USEDEP}]
	<=dev-libs/protobuf-3.0.0_beta2[python,${PYTHON_USEDEP}]
	virtual/python-dnspython[${PYTHON_USEDEP}]
	qrcode? ( media-gfx/zbar[python,v4l,${PYTHON_USEDEP}] )
	qt4? (
		dev-python/PyQt4[${PYTHON_USEDEP}]
	)
"
DEPEND="
	${PYTHON_DEPS}
	dev-python/setuptools[${PYTHON_USEDEP}]
	sys-apps/sed
	"

src_prepare() {
	# Prevent icon from being installed in the wrong location
	sed -i '/icons/d' setup.py || die

	distutils-r1_src_prepare
}
