# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DESCRIPTION="Meta package for GNOME-Light, merge this package to install"
HOMEPAGE="http://www.gnome.org/"
LICENSE="metapackage"
SLOT="2.0"
IUSE="cups +gnome-shell"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="*"

# XXX: Note to developers:
# This is a wrapper for the 'light' GNOME 3 desktop, and should only consist of
# the bare minimum of libs/apps needed. It is basically gnome-base/gnome without
# any apps, but shouldn't be used by users unless they know what they are doing.
RDEPEND="!gnome-base/gnome
	>=gnome-base/gnome-core-libs-${PV}[cups?]

	>=gnome-base/gnome-session-3.14.0
	>=gnome-base/gnome-settings-daemon-${PV}[cups?]
	>=gnome-base/gnome-control-center-${PV}[cups?]

	>=gnome-base/nautilus-3.14.0

	gnome-shell? (
		>=x11-wm/mutter-${PV}
		>=gnome-base/gnome-shell-${PV} )

	>=x11-themes/adwaita-icon-theme-3.14.0
	>=x11-themes/gnome-backgrounds-${PV}

	>=x11-terms/gnome-terminal-${PV}
"
DEPEND=""
PDEPEND=">=gnome-base/gvfs-1.22.0"
S="${WORKDIR}"

pkg_pretend() {
	if ! use gnome-shell; then
		# Users probably want to use e16, sawfish, etc
		ewarn "You're installing neither GNOME Shell"
		ewarn "You will have to install and manage a window manager by yourself"
	fi
}
