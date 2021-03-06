# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/arm/arm-1.4.5.0-r2.ebuild,v 1.1 2014/12/08 22:47:30 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE='ncurses'
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="A ncurses-based status monitor for Tor relays"
HOMEPAGE="http://www.atagar.com/arm/"
SRC_URI="http://www.atagar.com/arm/resources/static/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE=""

# Note: While we depend on net-misc/tor, we strictly speaking
# don't have to because it could run on a different machine.
RDEPEND="
	>=net-misc/tor-0.2.1.27
	app-admin/sudo
	sys-apps/man
	sys-process/lsof
	net-dns/bind-tools"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

python_prepare_all() {
	python_fix_shebang .

	distutils-r1_python_prepare_all
}

python_install() {
	distutils-r1_python_install \
		--docPath "${EPREFIX}/usr/share/doc/${PF}"

	sed -i -e "s:python:${EPYTHON}:" "${ED}"usr/bin/arm || die
}

pkg_postinst() {
	elog "Some graphing data issues have been noted in testing"
	elog "when run as root. It is not recommended to run arm as"
	elog "root until those issues have been isolated and fixed."
	elog
	elog "Trouble with graphs under app-misc/screen? Try:"
	elog 'TERM="rxvt-unicode" arm'
}
