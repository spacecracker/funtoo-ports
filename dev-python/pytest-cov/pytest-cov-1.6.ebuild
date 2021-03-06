# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pytest-cov/pytest-cov-1.6.ebuild,v 1.11 2014/12/16 20:44:36 maekke Exp $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{3,4}} pypy pypy3 )
inherit distutils-r1

DESCRIPTION="py.test plugin for coverage reporting"
HOMEPAGE="http://bitbucket.org/memedough/pytest-cov/overview"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 arm ~hppa ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/cov-core[${PYTHON_USEDEP}]"
