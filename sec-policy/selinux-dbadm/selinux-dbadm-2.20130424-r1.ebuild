# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-dbadm/selinux-dbadm-2.20130424-r1.ebuild,v 1.1 2013/05/06 14:46:41 swift Exp $
EAPI="4"

IUSE=""
MODS="dbadm"
BASEPOL="2.20130424-r1"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for dbadm"

KEYWORDS="~amd64 ~x86"