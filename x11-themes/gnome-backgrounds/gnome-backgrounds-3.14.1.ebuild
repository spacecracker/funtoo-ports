# Distributed under the terms of the GNU General Public License v2

EAPI="5"
GCONF_DEBUG="no"

inherit gnome2

DESCRIPTION="A set of backgrounds packaged with the GNOME desktop"
HOMEPAGE="https://git.gnome.org/browse/gnome-backgrounds"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=">=x11-themes/gnome-themes-standard-3.14.0"
DEPEND="
	>=dev-util/intltool-0.40.0
	sys-devel/gettext
"

src_compile() {
	cp "${FILESDIR}"/"${P}"-restore-3.10-backgrounds/* "${S}"/backgrounds

	gnome2_src_compile
}
