PKG_NAME="btfs"
PKG_VERSION="2.21"
PKG_SHA256="b170d01e362f34038a9bacf75f63eaab85093c1fd296c4f9ed17092f5ca2ccfa"
PKG_REV="3"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/johang/btfs"
PKG_URL="https://github.com/johang/${PKG_NAME}/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain curl fuse libtorrent-rasterbar"
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="btfs"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_SECTION="tools"
PKG_SHORTDESC="${PKG_ADDON_NAME}: bittorrent filesystem based on FUSE"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a bittorrent filesystem based on FUSE."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}
    cp -PR ${PKG_INSTALL}/usr/bin \
           ${ADDON_BUILD}/${PKG_ADDON_ID}
}
