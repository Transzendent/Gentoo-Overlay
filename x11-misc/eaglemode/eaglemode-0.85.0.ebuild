# Generic ebuild file for Eagle Mode 0.85.0

EAPI=2

DESCRIPTION="Zoomable user interface with plugin applications"
SRC_URI="http://prdownloads.sourceforge.net/${PN}/${P}.tar.bz2"
HOMEPAGE="http://eaglemode.sourceforge.net/"

KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-3"
IUSE=""

DEPEND="dev-lang/perl
	x11-libs/libX11
	virtual/jpeg
	media-libs/libpng
	media-libs/tiff
	media-libs/xine-lib
	gnome-base/librsvg
	app-text/poppler[cairo]
	media-libs/freetype"
RDEPEND="${DEPEND}
	x11-terms/xterm
	app-text/ghostscript-gpl"

src_compile() {
	perl make.pl build continue=no || die "build failed"
}

src_install() {
	perl make.pl install "root=${D}" "dir=/usr/lib/eaglemode" menu=yes bin=yes \
	|| die "install failed"
}
