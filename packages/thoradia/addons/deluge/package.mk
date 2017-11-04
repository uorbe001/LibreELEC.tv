PKG_NAME="deluge"
PKG_VERSION="1.3.15"
PKG_SHA256="6f2accf55bd97828f81ea13d5f29087103eb4f95b6be957323e23174cdc86826"
PKG_REV="23"
PKG_LICENSE="GPLv3"
PKG_SITE="http://deluge-torrent.org/"
PKG_URL="https://github.com/deluge-torrent/deluge/archive/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="deluge-deluge-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libtorrent-rasterbar python_deluge"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Deluge"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: lightweight, free software, cross-platform BitTorrent client"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a lightweight, free software, cross-platform BitTorrent client."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_IS_PYTHON="yes"

pre_make_target() {
  python setup.py build
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/deluge

  cp -LR $PKG_BUILD/.install_pkg/bin/deluge-web \
         $PKG_BUILD/.install_pkg/bin/deluged \
         $PKG_BUILD/.install_pkg/lib/*.egg \
         $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/libtorrent-rasterbar.so.? \
         $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/python*/site-packages/libtorrent.so \
         $(get_build_dir python_deluge)/.install_pkg/lib/*.egg/* \
         $ADDON_BUILD/$PKG_ADDON_ID/deluge/
}
