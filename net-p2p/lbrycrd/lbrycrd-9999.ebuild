# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools db-use git-r3 systemd user

DESCRIPTION="A fully decentralized network for distributing data"
HOMEPAGE="http://lbry.io/"
EGIT_REPO_URI="https://github.com/lbryio/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test upnp +wallet"

RDEPEND="
	dev-libs/boost[threads(+)]
	dev-libs/openssl:0[-bindist]
	sys-libs/db:$(db_ver_to_slot 4.8)[cxx]
	upnp? ( net-libs/miniupnpc )
	"
DEPEND="
	${RDEPEND}
	sys-apps/coreutils
	sys-apps/sed
	"

pkg_setup() {
	enewgroup lbry
	enewuser lbry -1 -1 /var/lib/lbry lbry
}

src_prepare() {
	sed \
		-e 's:bitcoin\.conf:lbrycrd.conf:g' \
		-e 's:\.bitcoin:.lbrycrd:g' \
		-e 's:\(/var/[^/]\+\)/bitcoind:\1/lbry:g' \
		-e 's:BITCOIN:LBRYCRD:g' \
		-e 's:bitcoind:lbrycrdd:g' \
		-e 's:\bbitcoin\b:lbry:g' \
		-e 's:\bBitcoin\b:LBRY.io:g' \
		-i contrib/init/bitcoind.*

	eautoreconf
}

src_configure() {
	econf \
		--disable-ccache \
		--disable-static \
		$(use_enable test tests) \
		--without-gui \
		--without-libs \
		$(use_with upnp miniupnpc) \
		$(use_enable upnp upnp-default) \
		$(use_enable wallet)
}

src_test() {
	emake check
}

src_install() {
	default

	insinto /etc/lbry
	cat > "${D}/etc/lbry/lbrycrd.conf" <<-EOF
	port=28333
	rpcuser=lbrycrd
	rpcpassword=$(
		if [[ -s ${ROOT}/etc/lbry/lbrycrd.conf ]] ; then
			sed -e 's/^\s*rpcpassword\s*=\s*\(.*\S\)\s*$/\1/;t;d' "${ROOT}/etc/lbry/lbrycrd.conf"
		else
			tr -dc [:alnum:] < /dev/urandom | head -c32
		fi )
	rpcport=28332
	EOF
	fowners lbry:lbry /etc/lbry/lbrycrd.conf
	fperms 0600 /etc/lbry/lbrycrd.conf

	newconfd contrib/init/bitcoind.openrcconf lbrycrdd
	newinitd contrib/init/bitcoind.openrc lbrycrdd
	systemd_newunit contrib/init/bitcoind.service lbrycrdd.service

	keepdir /var/lib/lbry/.lbrycrd
	fowners lbry:lbry /var/lib/lbry{,/.lbrycrd}
	fperms 0700 /var/lib/lbry
	dosym /etc/lbry/lbrycrd.conf /var/lib/lbry/.lbrycrd/lbrycrd.conf

	rm -f "${D}/usr/bin/test_lbrycrd"
}
