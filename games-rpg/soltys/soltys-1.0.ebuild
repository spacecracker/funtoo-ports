# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-rpg/soltys/soltys-1.0.ebuild,v 1.1 2014/10/30 00:16:18 calchan Exp $

EAPI=5
inherit unpacker eutils games

DESCRIPTION="Classic adventure game"
HOMEPAGE="http://wiki.scummvm.org/index.php/Soltys"
SRC_URI="linguas_en? ( mirror://sourceforge/scummvm/${PN}-en-v${PV}.zip )
	linguas_es? ( mirror://sourceforge/scummvm/${PN}-es-v${PV}.zip )
	linguas_pl? ( mirror://sourceforge/scummvm/${PN}-pl-v${PV}.zip )
	!linguas_en? ( !linguas_es? ( !linguas_pl? ( mirror://sourceforge/scummvm/${PN}-en-v${PV}.zip ) ) )
	http://www.scummvm.org/images/cat-soltys.png"

LICENSE="Soltys"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="linguas_en linguas_es linguas_pl"

RDEPEND=">=games-engines/scummvm-1.5"
DEPEND="$(unpacker_src_uri_depends)"

S=${WORKDIR}

src_unpack() {
	if use linguas_en || ( ! use linguas_en && ! use linguas_es && ! use linguas_pl ) ; then
		mkdir -p en || die
		unpacker ${PN}-en-v${PV}.zip
		mv vol.{cat,dat} en/ || die
	fi
	if use linguas_es ; then
		mkdir -p es || die
		unpacker ${PN}-es-v${PV}.zip
		mv soltys-es-v1-0/vol.{cat,dat} es/ || die
	fi
	if use linguas_pl ; then
		mkdir -p pl || die
		unpacker ${PN}-pl-v${PV}.zip
		mv vol.{cat,dat} pl/ || die
	fi
}

src_prepare() {
	rm -rf license.txt soltys-es-v1-0
}

src_install() {
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r *
	newicon "${DISTDIR}"/cat-soltys.png soltys.png
	if use linguas_en || ( ! use linguas_en && ! use linguas_es && ! use linguas_pl ) ; then
		games_make_wrapper soltys-en "scummvm -f -g hq3x -p \"${GAMES_DATADIR}/${PN}/en\" soltys" .
		make_desktop_entry ${PN}-en "Soltys (English)" soltys
	fi
	if use linguas_es ; then
		games_make_wrapper soltys-es "scummvm -f -g hq3x -p \"${GAMES_DATADIR}/${PN}/es\" soltys" .
		make_desktop_entry ${PN}-es "Soltys (Español)" soltys
	fi
	if use linguas_pl ; then
		games_make_wrapper soltys-pl "scummvm -f -g hq3x -p \"${GAMES_DATADIR}/${PN}/pl\" soltys" .
		make_desktop_entry ${PN}-pl "Soltys (Polski)" soltys
	fi
	prepgamesdirs
}
