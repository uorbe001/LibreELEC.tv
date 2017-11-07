PKG_NAME="sonarr"
PKG_VERSION="2.0.0.5054"
PKG_SHA256="f187587ae648d5ef19e605857a6e8cbb088368cf96244c6038fb27b439441997"
PKG_REV="23"
PKG_LICENSE="GPL3"
PKG_SITE="https://sonarr.tv/"
PKG_URL="http://download.sonarr.tv/v2/master/mono/NzbDrone.master.$PKG_VERSION.mono.tar.gz"
PKG_SOURCE_DIR="NzbDrone"
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

make_target() {
  :
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/NzbDrone"
  cp -PR "$PKG_BUILD"/* "$ADDON_BUILD/$PKG_ADDON_ID/NzbDrone"
}
