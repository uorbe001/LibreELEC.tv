PKG_NAME="radarr"
PKG_VERSION="0.2.0.1217"
PKG_SHA256="5e0ef4d5c1fc3c6c1f113f9be0565c1c0b82e51d011890543a0b957db1dbff27"
PKG_REV="20"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Radarr/Radarr"
PKG_URL="https://github.com/Radarr/Radarr/releases/download/v$PKG_VERSION/Radarr.v$PKG_VERSION.linux.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Radarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="virtual.thoradia-mono:0.0.0"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: a fork of Sonarr to work with movies à la CouchPotato"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a fork of Sonarr to work with movies à la CouchPotato."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="manual"

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/Radarr"
  cp -PR "$PKG_BUILD"/* "$ADDON_BUILD/$PKG_ADDON_ID/Radarr"
}
