# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools db-use git-r3 user

DESCRIPTION="A fully decentralized network for distributing data"
HOMEPAGE="http://lbry.io/"
EGIT_REPO_URI="https://github.com/lbryio/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test upnp"

RDEPEND="
	dev-libs/boost[threads(+)]
	dev-libs/openssl:0[-bindist]
	sys-libs/db:$(db_ver_to_slot 4.8)[cxx]
	upnp? ( net-libs/miniupnpc )
	"
DEPEND="${RDEPEND}"

pkg_setup() {
	enewgroup lbry
	enewuser lbry -1 -1 /var/lib/lbry lbry
}

src_prepare() {
	eautoreconf
}

src_configure() {
	local -a my_econf
	use upnp && my_econf+=( '--enable-upnp-default' )
	econf \
		--disable-ccache \
		--disable-static \
		$(use_enable test tests) \
		--without-gui \
		--without-libs \
		$(use_with upnp miniupnpc) \
		"${my_econf[@]}"
}

src_test() {
	emake check
}

src_install() {
	default
	rm "${D}/usr/bin/test_lbrycrd"
}
