PKG_NAME="medusa"
PKG_VERSION="0.1.17"
PKG_SHA256="767bfd1360427ee825336e073353939880afa549c542bce7eb1599de5184736b"
PKG_REV="1"
PKG_SITE="https://github.com/pymedusa/Medusa"
PKG_URL="https://github.com/pymedusa/Medusa/archive/v$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Medusa-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain unrar"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Medusa"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: automatic video library manager for TV shows"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) watches for new episodes of your favorite shows, and when they are posted it does its magic."
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  :
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin \
           $ADDON_BUILD/$PKG_ADDON_ID/medusa

  cp -PR $(get_build_dir unrar)/unrar \
         $ADDON_BUILD/$PKG_ADDON_ID/bin/

  cp -PR $PKG_BUILD/* \
         $ADDON_BUILD/$PKG_ADDON_ID/medusa/
}
