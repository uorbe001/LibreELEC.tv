PKG_NAME="jackett"
PKG_VERSION="0.16.912"
PKG_SHA256="3021e426849fe0573a809a17480582ffce37e1a8bb1263fdf7b13a4b512462b9"
PKG_REV="45"
PKG_LICENSE="GPL2"
PKG_SITE="https://github.com/Jackett/Jackett"
PKG_URL="https://github.com/Jackett/Jackett/releases/download/v${PKG_VERSION}/Jackett.Binaries.Mono.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jackett"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.mono:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: proxy to tracker sites"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) works as a proxy server: it translates queries from applications (CouchPotato, Mylar, SickRage, Sonarr,  etc.) into tracker-site-specific HTTP queries, parses the HTML response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping and translation logic, removing the burden from other applications."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -PR ${PKG_BUILD}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
