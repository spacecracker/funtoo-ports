# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/aewan/aewan-1.0.01-r1.ebuild,v 1.5 2014/11/20 00:25:03 jer Exp $

EAPI=5

inherit autotools eutils

DESCRIPTION="A curses-based ascii-art editor"
HOMEPAGE="http://aewan.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DOCS=( CHANGELOG README TODO )

DEPEND="sys-libs/zlib
	>=sys-libs/ncurses-5.0"

RDEPEND="${DEPEND}"

src_prepare() {
	epatch \
		"${FILESDIR}/${P}-debug_aewl-warnings.patch" \
		"${FILESDIR}/${P}-tinfo.patch"
	eautoreconf
}
