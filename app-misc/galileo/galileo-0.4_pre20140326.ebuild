# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 vcs-snapshot user systemd udev

COMMIT_ID="aaec22d2697c8530194ba00d7dc6c086baff5899"

HOMEPAGE="https://bitbucket.org/benallard/galileo"
SRC_URI="https://bitbucket.org/benallard/galileo/get/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
DESCRIPTION="Synchronisation utility for Bluetooth LE-based Fitbit trackers"
LICENSE="LGPL-3+"
SLOT="0"
IUSE=""

RUN_UID=galileo
RUN_GID=galileo

DUMPDIR=/var/lib/galileo/dump
LOGDIR=/var/log/galileo

# Runtime dependencies
RDEPEND="
	>=dev-python/pyusb-1.0.0_alpha1
	>=dev-python/requests-0.13.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	>=virtual/udev-208
	"

pkg_setup() {
	# Create the user and group if not already present
	enewgroup ${RUN_GID}
	enewuser ${RUN_UID} -1 -1 "/dev/null" ${RUN_GID}
}

src_prepare() {
	einfo "Applying patches"
	epatch "${FILESDIR}/gentoo-no-tests.patch"

	# Main python package installation
	einfo "Performing standard Python ebuild install"
	distutils-r1_python_prepare
}

python_install_all() {

	# Initialisation (OpenRC)
	einfo "Installing initialisation scripts (OpenRC and systemd)"
	newinitd "${FILESDIR}/galileo.init.d" "${PN}"
	systemd_dounit "${FILESDIR}/galileo.service"

	# udev rule
	einfo "Installing tracker USB dongle udev rule"
	insinto "$(get_udevdir)/rules.d"
	newins "${FILESDIR}/galileo.udev" 99-galileo.rules

	# Configuration
	einfo "Installing default configuration"
	insinto /etc
	newins "${FILESDIR}/galileorc-2" galileorc

	# Initialise log directory
	einfo "Initialising logfile directory"
	dodir "${LOGDIR}"
	fperms 770 "${LOGDIR}"
	fowners ${RUN_UID}:${RUN_GID} "${LOGDIR}"
	touch "${ED}/${LOGDIR}/galileo.log"
	fowners ${RUN_UID}:${RUN_GID} "${LOGDIR}/galileo.log"

	# Log rotation
	einfo "Installing logfile rotation"
	insinto /etc/logrotate.d
	newins "${FILESDIR}/galileo.logrotate.d" "${PN}"

	# Initialize server cache directory
	einfo "Initialising tracker dump directory"
	dodir "${DUMPDIR}"
	fowners ${RUN_UID}:${RUN_GID} "${DUMPDIR}"
	fperms 770 "${DUMPDIR}"

	# Main python package installation
	einfo "Performing standard Python ebuild install"
	distutils-r1_python_install_all
}
