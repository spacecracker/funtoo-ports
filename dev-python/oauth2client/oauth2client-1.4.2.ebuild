# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/oauth2client/oauth2client-1.4.2.ebuild,v 1.2 2014/12/06 12:14:04 jlec Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Library for accessing resources protected by OAuth 2.0"
HOMEPAGE="https://github.com/google/oauth2client"
SRC_URI="https://github.com/google/oauth2client/archive/v1.4.2.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="
	>=dev-python/httplib2-0.8[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-modules-0.0.5[${PYTHON_USEDEP}]
	>=dev-python/rsa-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/six-1.6.1[${PYTHON_USEDEP}]
	!<=dev-python/google-api-python-client-1.1[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
"

# Needs network
RESTRICT=test

python_test() {
	nosetests || die
}
