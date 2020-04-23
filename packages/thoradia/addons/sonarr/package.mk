PKG_NAME="sonarr"
PKG_VERSION="3.0.3.770"
PKG_SHA256="84e40e07bcc7b152e5ac65cee639bb7fd6e578587cf957b5d50df1ee829531ea"
PKG_REV="35"
PKG_LICENSE="GPLv3"
PKG_SITE="https://sonarr.tv/"
PKG_URL="http://download.sonarr.tv/v3/phantom-develop/${PKG_VERSION}/Sonarr.phantom-develop.${PKG_VERSION}.linux.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Sonarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="virtual.thoradia-mono:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a PVR for Usenet and BitTorrent users"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a PVR for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -PR ${PKG_BUILD}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
