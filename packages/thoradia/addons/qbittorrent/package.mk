PKG_NAME="qbittorrent"
PKG_VERSION="4.0.4"
PKG_SHA256="17f69223aa4a08c2466147ee6f884da7b8e6746f7658fb4bcdb0e17c3625b990"
PKG_REV="12"
PKG_LICENSE="GPLv2"
PKG_SITE="http://www.qbittorrent.org/"
PKG_URL="https://github.com/qbittorrent/qBittorrent/archive/release-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="qBittorrent-release-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libtorrent-rasterbar qt-everywhere"
PKG_TOOLCHAIN="configure"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="qBittorrent"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: efficient feature complete C++ bittorrent implementation"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is an efficient feature complete C++ bittorrent implementation."
PKG_DISCLAIMER="Keep it legal and carry on"


PKG_CONFIGURE_OPTS_TARGET="--disable-gui \
                           --prefix=$SYSROOT_PREFIX/usr \
                           --with-boost=$SYSROOT_PREFIX/usr"

export LDFLAGS="-L$SYSROOT_PREFIX/usr/plugins/bearer $LDFLAGS"

makeinstall_target() {
 $STRIP src/qbittorrent-nox
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -P $PKG_BUILD/.$TARGET_NAME/src/qbittorrent-nox \
        $ADDON_BUILD/$PKG_ADDON_ID/bin/

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -L $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/libtorrent-rasterbar.so.? \
        $ADDON_BUILD/$PKG_ADDON_ID/lib/
}
