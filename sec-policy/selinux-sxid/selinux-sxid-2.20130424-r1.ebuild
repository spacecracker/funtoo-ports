# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-sxid/selinux-sxid-2.20130424-r1.ebuild,v 1.1 2013/05/06 14:46:25 swift Exp $
EAPI="4"

IUSE=""
MODS="sxid"
BASEPOL="2.20130424-r1"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for sxid"

KEYWORDS="~amd64 ~x86"