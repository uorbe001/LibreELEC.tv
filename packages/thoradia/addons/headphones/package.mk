PKG_NAME="headphones"
PKG_VERSION="b45f3565da1759485b632493f295bab900df1e7e"
PKG_SHA256="212f5dccb9511519646089acefd393bf01d338a13c7320b75605c5580d379131"
PKG_REV="20"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/rembo10/headphones"
PKG_URL="https://github.com/rembo10/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain python_common"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Headphones"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: automated music downloader for NZB and Torrent"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is an automated music downloader for NZB and Torrent. It supports SABnzbd, NZBget, Transmission, µTorrent, Deluge and Blackhole."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="manual"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/headphones

  cp -PR $PKG_BUILD/* \
         $ADDON_BUILD/$PKG_ADDON_ID/headphones 

  cp -PR "$(get_build_dir python_common)/.install_pkg/usr/lib" \
         "$ADDON_BUILD/$PKG_ADDON_ID"
}
