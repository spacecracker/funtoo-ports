# Copyright owners: Gentoo Foundation
#                   Arfrever Frehtes Taifersar Arahesis
# Distributed under the terms of the GNU General Public License v2

EAPI="5-progress"
PYTHON_MULTIPLE_ABIS="1"
PYTHON_RESTRICTED_ABIS="*-jython"

inherit distutils

DESCRIPTION="Python HTTP for Humans."
HOMEPAGE="http://python-requests.org/ https://github.com/kennethreitz/requests https://pypi.python.org/pypi/requests"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND="app-misc/ca-certificates
	$(python_abi_depend dev-python/chardet)
	$(python_abi_depend dev-python/urllib3)"
DEPEND="${RDEPEND}
	$(python_abi_depend dev-python/setuptools)
	test? ( $(python_abi_depend dev-python/pytest) )"

DOCS="HISTORY.rst README.rst"

src_prepare() {
	distutils_src_prepare

	# Use app-misc/ca-certificates.
	sed -e "19a\\    if os.path.exists('${EPREFIX}/etc/ssl/certs/ca-certificates.crt'):\n        return '${EPREFIX}/etc/ssl/certs/ca-certificates.crt'\n" -i requests/certs.py

	# Use system version of dev-python/chardet.
	sed -e "s/from .packages import chardet/import chardet/" -i requests/compat.py
	rm -r requests/packages/chardet

	# Use system version of dev-python/urllib3.
	sed -e "s/from . import urllib3/import urllib3/" -i requests/packages/__init__.py
	sed -e "s/\(from \).packages.\(urllib3.* import\)/\1\2/" -i requests/*.py
	rm -r requests/packages/urllib3

	# Disable installation of deleted internal copies of dev-python/chardet and dev-python/urllib3.
	sed -e "/requests\.packages\./d" -i setup.py

	preparation() {
		cp test_requests.py test_requests-${PYTHON_ABI}.py
		if has "$(python_get_version -l)" 3.1 3.2; then
			2to3-${PYTHON_ABI} -f unicode -nw --no-diffs test_requests-${PYTHON_ABI}.py
			sed -e "s/data=u'/data='/" -i test_requests-${PYTHON_ABI}.py
		fi
	}
	python_execute_function preparation
}

src_test() {
	testing() {
		python_execute PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" test_requests-${PYTHON_ABI}.py -v
	}
	python_execute_function testing
}
