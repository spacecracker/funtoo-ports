# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/websockify/websockify-0.6.0.ebuild,v 1.1 2014/11/18 23:58:56 prometheanfire Exp $

EAPI=5
PYTHON_COMPAT=( python2_6 python2_7 )

inherit distutils-r1

SRC_URI="https://github.com/kanaka/${PN}/archive/v${PV}.zip"
DESCRIPTION="WebSockets support for any application/server"
HOMEPAGE="https://github.com/kanaka/websockify"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]"
