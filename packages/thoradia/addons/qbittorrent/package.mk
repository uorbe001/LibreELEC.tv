PKG_NAME="qbittorrent"
PKG_VERSION="4.2.5"
PKG_SHA256="1dac52d6fe4b0c44dba04fcfc41f519c57a69cb30580255edca95c87053a4324"
PKG_REV="28"
PKG_LICENSE="GPLv2"
PKG_SITE="http://www.qbittorrent.org/"
PKG_URL="https://github.com/qbittorrent/qBittorrent/archive/release-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libtorrent-rasterbar qt-everywhere"
PKG_TOOLCHAIN="configure"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="qBittorrent"
PKG_MAINTAINER="thoradia"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: efficient feature complete C++ bittorrent implementation"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is an efficient feature complete C++ bittorrent implementation."
PKG_ADDON_TYPE="xbmc.service"
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CONFIGURE_OPTS_TARGET="--disable-gui \
                           --prefix=${SYSROOT_PREFIX}/usr \
                           --with-boost=${SYSROOT_PREFIX}/usr"

post_configure_target() {
  sed -i "s\ /usr/plugins\ ${SYSROOT_PREFIX}/usr/plugins\g" src/Makefile
}

post_make_target() {
  ${STRIP} ${PKG_BUILD}/.${TARGET_NAME}/src/qbittorrent-nox
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/src/qbittorrent-nox \
          ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
}
