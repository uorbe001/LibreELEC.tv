PKG_NAME="sonarr"
PKG_VERSION="3.0.3.616"
PKG_SHA256="18ccd364ec6ca74618bd14e76ba59d93dc52028ab9e735a4d26ca7e5ec5c8c44"
PKG_REV="32"
PKG_LICENSE="GPLv3"
PKG_SITE="https://sonarr.tv/"
PKG_URL="http://download.sonarr.tv/v3/phantom-develop/$PKG_VERSION/Sonarr.phantom-develop.$PKG_VERSION.linux.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Sonarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="virtual.thoradia-mono:0.0.0"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: a PVR for Usenet and BitTorrent users"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a PVR for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="manual"

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/sonarr"
  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/sonarr
}
