PKG_NAME="medusa"
PKG_VERSION="0.3.4"
PKG_SHA256="f1f688f9f64753e4ba4c7d83775e90a8fcc58e9babe8643a52a236aa9864c531"
PKG_REV="6"
PKG_SITE="https://github.com/pymedusa/Medusa"
PKG_URL="https://github.com/pymedusa/Medusa/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain unrar"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Medusa"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="service.locale:0.0.0 tools.ffmpeg-tools:0.0.0"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: automatic video library manager for TV shows"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) watches for new episodes of your favorite shows, and when they are posted it does its magic."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="manual"

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
