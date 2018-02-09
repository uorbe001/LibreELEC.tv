PKG_NAME="lidarr"
PKG_VERSION="0.2.0.267"
PKG_SHA256="74381822453de81427c58467f280f549a36e9d7fd05c3840454c24afde9f775b"
PKG_REV="1"
PKG_LICENSE="GPLv3"
PKG_SITE="http://lidarr.audio/"
PKG_URL="https://ci.appveyor.com/api/buildjobs/3407qv0i5s9l7fl4/artifacts/Lidarr.develop.0.2.0.267.linux.tar.gz"
PKG_SOURCE_DIR="Lidarr"
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
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/Lidarr"
  cp -PR "$PKG_BUILD"/* "$ADDON_BUILD/$PKG_ADDON_ID/Lidarr"
}
