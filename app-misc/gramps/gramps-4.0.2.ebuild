# EBuild for Gramps 4.0.2

EAPI=5

inherit eutils python

DESCRIPTION="Genealogical Research and Analysis Management Programming System"
HOMEPAGE="http://www.Gramps-Project.org/"
SRC_URI="http://sourceforge.net/projects/gramps/files/Stable/${PV}/${P}.tar.gz/download -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="osm_gps_maps"

PYTHON_DEPEND="3:3.2"
GCONF_DEBUG="no"

RDEPEND=">=dev-lang/python-3.2
	>=x11-libs/gtk+-3
	>=dev-python/pygobject-3
	x11-libs/cairo
	x11-libs/pango[introspection]
	x11-misc/xdg-utils
	gnome-base/librsvg
	dev-python/pyicu
	dev-python/bsddb3
	media-gfx/graphviz
	media-libs/gexiv2
	osm_gps_maps? ( dev-python/python-osmgpsmap )"

DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/libiconv
	virtual/pkgconfig"

DOCS="NEWS README TODO"

pkg_setup() {
	python_pkg_setup
}

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_prepare() {
	python setup.py build
}

src_install() {
	python setup.py install --root ${D}
	einfo "Correcting resource-path..."
	sed "s;${D};/;" -i ${D}/$(python_get_sitedir)/${PN}/gen/utils/resource-path
}
