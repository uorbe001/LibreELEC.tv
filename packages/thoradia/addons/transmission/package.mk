PKG_NAME="transmission"
PKG_VERSION="3.00-beta"
PKG_SHA256="6c5a30c737bcab51a93f99cae4e1e5d3a1115934aa63effefc8a8cea1dfae320"
PKG_REV="18"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL="https://raw.githubusercontent.com/thoradia/LibreELEC.tv/sources/transmission-3.00-beta.tar.gz"
PKG_DEPENDS_TARGET="toolchain curl libiconv libevent systemd"
PKG_SECTION="service"
PKG_TOOLCHAIN="cmake-make"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Transmission"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: a fast, easy and free BitTorrent client"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a fast, easy and free BitTorrent client."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CMAKE_OPTS_TARGET="-DENABLE_DAEMON=ON \
                       -DENABLE_GTK=OFF \
                       -DENABLE_QT=OFF \
                       -DENABLE_MAC=OFF \
                       -DENABLE_UTILS=OFF \
                       -DENABLE_CLI=OFF \
                       -DENABLE_TESTS=OFF \
                       -DENABLE_LIGHTWEIGHT=OFF \
                       -DENABLE_UTP=ON \
                       -DENABLE_NLS=OFF \
                       -DINSTALL_DOC=OFF \
                       -DINSTALL_LIB=OFF \
                       -DUSE_SYSTEM_EVENT2=ON \
                       -DUSE_SYSTEM_DHT=OFF \
                       -DUSE_SYSTEM_MINIUPNPC=OFF \
                       -DUSE_SYSTEM_NATPMP=OFF \
                       -DUSE_SYSTEM_UTP=OFF \
                       -DUSE_SYSTEM_B64=OFF \
                       -DWITH_CRYPTO=openssl \
                       -DWITH_SYSTEMD=ON"

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID"
  cp -PR "$PKG_BUILD/.install_pkg/usr/bin" \
         "$PKG_BUILD/.install_pkg/usr/share/transmission/web" \
         "$ADDON_BUILD/$PKG_ADDON_ID"
}
