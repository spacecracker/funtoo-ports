# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/openal/openal-1.4.0.2.ebuild,v 1.1 2013/04/03 11:49:27 gienah Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="OpenAL"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A binding to the OpenAL cross-platform 3D audio API"
HOMEPAGE="http://connect.creativelabs.com/openal/"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE=""

RDEPEND="dev-haskell/objectname:=[profile?]
		dev-haskell/statevar:=[profile?]
		dev-haskell/tensor:=[profile?]
		media-libs/openal
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		dev-haskell/cabal"

S="${WORKDIR}/${MY_P}"