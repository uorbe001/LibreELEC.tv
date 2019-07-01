PKG_NAME="lidarr"
PKG_VERSION="0.6.2.883"
PKG_SHA256="9bbc3cc18ce73bdc491a39d2ab1c20052b9e6d40e4db8d9080691c78b7902601"
PKG_REV="8"
PKG_LICENSE="GPLv3"
PKG_SITE="http://lidarr.audio/"
PKG_URL="https://github.com/lidarr/Lidarr/releases/download/v$PKG_VERSION/Lidarr.develop.$PKG_VERSION.linux.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Lidarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="virtual.thoradia-mono:0.0.0"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: a music collection manager for Usenet and BitTorrent users"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="manual"

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/lidarr"
  cp -PR "$PKG_BUILD"/* "$ADDON_BUILD/$PKG_ADDON_ID/lidarr"
}
