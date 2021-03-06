# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pylzma/pylzma-0.4.6.ebuild,v 1.1 2014/12/04 04:56:31 patrick Exp $

EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})
# hashlib module required.

inherit distutils-r1

DESCRIPTION="Python bindings for the LZMA compression library"
HOMEPAGE="http://www.joachim-bauch.de/projects/python/pylzma/ http://pypi.python.org/pypi/pylzma"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="dev-python/m2crypto[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=(doc/USAGE.md README.md)

python_compile() {
	python_is_python3 || local -x CFLAGS="${CFLAGS} -fno-strict-aliasing"
	distutils-r1_python_compile
}
