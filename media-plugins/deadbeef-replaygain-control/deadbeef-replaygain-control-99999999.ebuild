# Distributed under the terms of the GNU General Public License v2=

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins git-r3

GITHUB_USERNAME="cboxdoerfer"
GITHUB_REPOSITORY="ddb_replaygain_control"

DESCRIPTION="DeaDBeeF replay gain control plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
EGIT_REPO_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}.git"

LICENSE="GPL-2"
KEYWORDS=""

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags.patch"
}
