# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_auth_radius/mod_auth_radius-1.5.8.ebuild,v 1.1 2013/05/08 13:52:15 chainsaw Exp $

EAPI="5"

inherit apache-module base

DESCRIPTION="Radius authentication for Apache."
HOMEPAGE="http://freeradius.org/mod_auth_radius/"
SRC_URI="ftp://ftp.freeradius.org/pub/radius/${P}.tar"

LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

APACHE2_MOD_FILE=".libs/mod_auth_radius-2.0.so"
APACHE2_MOD_DEFINE="AUTH_RADIUS"

APXS2_ARGS="-c ${PN}-2.0.c"

PATCHES=(
	"${FILESDIR}/${PV}-includes.patch"
	"${FILESDIR}/${PV}-remote_ip-obsolete.patch"
)

DOCFILES="README"

need_apache2

src_compile() {
	apache-module_src_compile
}

src_install() {
	apache-module_src_install
}