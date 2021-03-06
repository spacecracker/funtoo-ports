# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/jekyll-sitemap/jekyll-sitemap-0.7.0.ebuild,v 1.1 2014/12/08 10:28:23 mrueg Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md History.markdown"

inherit ruby-fakegem

DESCRIPTION="Automatically generate a sitemap.xml for your Jekyll site"
HOMEPAGE="https://github.com/jekyll/jekyll-sitemap"
SRC_URI="https://github.com/jekyll/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=www-apps/jekyll-2 )"

all_ruby_prepare() {
	# Fix tests until rspec:3 is in the tree
	sed -i -e "s/truthy/true/" -e "s/falsey/false/" spec/jekyll-sitemap_spec.rb || die
}
