# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gdk3/ruby-gdk3-2.2.3.ebuild,v 1.1 2014/12/07 05:36:39 naota Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

inherit ruby-ng-gnome2

DESCRIPTION="Ruby GDK-3.x bindings"
KEYWORDS="~amd64 ~ppc"
IUSE=""

DEPEND="${DEPEND} x11-libs/gtk+:3"
RDEPEND="${RDEPEND} x11-libs/gtk+:3"

ruby_add_bdepend ">=dev-ruby/ruby-glib2-${PV}"
ruby_add_rdepend ">=dev-ruby/ruby-gdkpixbuf2-${PV}
	>=dev-ruby/ruby-atk-${PV}
	>=dev-ruby/ruby-pango-${PV}"

each_ruby_configure() {
	:
}

each_ruby_compile() {
	:
}

each_ruby_install() {
	each_fakegem_install
}
