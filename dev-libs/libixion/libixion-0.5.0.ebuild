# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libixion/libixion-0.5.0.ebuild,v 1.2 2013/04/19 10:46:29 scarabeus Exp $

EAPI=5

EGIT_REPO_URI="git://gitorious.org/ixion/ixion.git"

[[ ${PV} == 9999 ]] && GITECLASS="git-2 autotools"
inherit eutils ${GITECLASS}
unset GITECLASS

DESCRIPTION="General purpose formula parser & interpreter"
HOMEPAGE="http://gitorious.org/ixion/pages/Home"
[[ ${PV} == 9999 ]] || SRC_URI="http://kohei.us/files/ixion/src/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0/0.5"
[[ ${PV} == 9999 ]] || \
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE="static-libs"

RDEPEND=""
DEPEND=">=dev-util/mdds-0.7.1"

src_prepare() {
	[[ ${PV} == 9999 ]] && eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_install() {
	default

	prune_libtool_files --all
}