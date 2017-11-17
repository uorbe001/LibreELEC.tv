PKG_NAME="nzbhydra"
PKG_VERSION="0.2.230"
PKG_SHA256="d11ae66a821efb7b20cf19c80b0a424751064bd9ed2b4845fc05e841f13c17e6"
PKG_REV="1"
PKG_SITE="https://github.com/theotherp/nzbhydra"
PKG_URL="https://github.com/theotherp/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="NZBHydra"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: meta search for NZB indexers "
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a meta search for NZB indexers. It provides easy access to a number of raw and newznab based indexers. You can search all your indexers from one place and use it as indexer source for tools like Sonarr or CouchPotato."
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  :
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/nzbhydra"

  cp -PR "$PKG_BUILD"/* \
         "$ADDON_BUILD/$PKG_ADDON_ID/nzbhydra"
}
