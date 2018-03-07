PKG_NAME="lidarr"
PKG_VERSION="0.2.0.291"
PKG_SHA256="2b1ee52ae015149ec2f5d6a28643282f18106b9873f494ba26618e256e12ea83"
PKG_REV="4"
PKG_LICENSE="GPLv3"
PKG_SITE="http://lidarr.audio/"
PKG_URL="https://ci.appveyor.com/api/buildjobs/e9247o9i1s614hc2/artifacts/Lidarr.develop.0.2.0.291.linux.tar.gz"
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
