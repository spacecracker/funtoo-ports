# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libiscsi/libiscsi-1.9.0.ebuild,v 1.2 2013/03/16 05:18:16 cardoe Exp $

EAPI=5

if [[ ${PV} = *9999* ]]; then
	AUTOTOOLS_AUTORECONF="1"
	inherit git-2 autotools-utils
	SRC_URI=""
	EGIT_REPO_URI="git://github.com/sahlberg/libiscsi.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/sahlberg/libiscsi/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="iscsi client library and utilities"
HOMEPAGE="https://github.com/sahlberg/libiscsi"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"