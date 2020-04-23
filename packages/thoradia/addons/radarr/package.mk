PKG_NAME="radarr"
PKG_VERSION="0.2.0.1480"
PKG_SHA256="90982ad0c33df6aa5dc0ba26874b7b53ace13fcea700ac4268f146315dcad318"
PKG_REV="26"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Radarr/Radarr"
PKG_URL="https://github.com/Radarr/Radarr/releases/download/v${PKG_VERSION}/Radarr.develop.${PKG_VERSION}.linux.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Radarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="virtual.thoradia-mono:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a fork of Sonarr to work with movies à la CouchPotato"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a fork of Sonarr to work with movies à la CouchPotato."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -PR ${PKG_BUILD}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
