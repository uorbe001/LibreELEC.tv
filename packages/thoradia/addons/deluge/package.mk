PKG_NAME="deluge"
PKG_VERSION="1.3.15"
PKG_LICENSE="GPLv3"
PKG_SITE="http://deluge-torrent.org/"
PKG_URL="https://github.com/deluge-torrent/deluge/archive/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="deluge-deluge-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libtorrent-rasterbar"
PKG_SECTION="service"

PKG_IS_PYTHON="yes"
PKG_PYTHON_DEPENDS_TARGET="chardet mako pyopenssl python-gettext pyxdg twisted"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Deluge"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_REV="20"
PKG_SHORTDESC="$PKG_ADDON_NAME: lightweight, free software, cross-platform BitTorrent client"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a lightweight, free software, cross-platform BitTorrent client"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/deluge

  cp -PR $PKG_BUILD/.install_pkg/usr/bin/deluged \
         $PKG_BUILD/.install_pkg/usr/bin/deluge-web \
         $PKG_BUILD/.install_pkg/usr/lib/python*/site-packages/* \
         $SYSROOT_PREFIX/usr/lib/libboost_python.so.* \
         $(get_build_dir setuptools)/build/lib/pkg_resources \
         $ADDON_BUILD/$PKG_ADDON_ID/deluge/

  cp -L $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/libtorrent-rasterbar.so.? \
        $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/python*/site-packages/libtorrent.so \
        $ADDON_BUILD/$PKG_ADDON_ID/deluge/
}
