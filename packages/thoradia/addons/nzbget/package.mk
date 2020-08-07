PKG_NAME="nzbget"
PKG_VERSION="21.0"
PKG_SHA256="c7d3ece53f9bf958011b05404bf4063d74bd73fc8140a63c334e9e767eff6d50"
PKG_REV="16"
PKG_LICENSE="GPLv2"
PKG_SITE="http://nzbget.net/"
PKG_URL="https://github.com/nzbget/${PKG_NAME}/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl libxml2 p7zip unrar zlib"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="NZBGet"
PKG_ADDON_TYPE="xbmc.service"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: efficient Usenet downloader"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is an efficient Usenet downloader."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CONFIGURE_OPTS_TARGET="--disable-curses"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/config
    cp -PR ${PKG_INSTALL}/usr/share/nzbget/nzbget.conf \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/config

  cp -PR ${PKG_INSTALL}/usr/bin \
         ${PKG_INSTALL}/usr/share/nzbget/webui \
         ${ADDON_BUILD}/${PKG_ADDON_ID}

  cp -PR $(get_install_dir p7zip)/usr/bin/* \
         $(get_install_dir unrar)/usr/bin/unrar \
         ${ADDON_BUILD}/${PKG_ADDON_ID}/bin

  sed -e "s|^MainDir=.*$|MainDir=/storage/.kodi/userdata/addon_data/service.nzbget|" \
      -e "s|^WebDir.*$|WebDir=/storage/.kodi/addons/service.nzbget/webui|" \
      -e "s|^ConfigTemplate=.*$|ConfigTemplate=/storage/.kodi/addons/service.nzbget/config/nzbget.conf|" \
      -e "s|^OutputMode=.*$|OutputMode=loggable|" \
      -e "s|^UnrarCmd=.*$|UnrarCmd=/storage/.kodi/addons/service.nzbget/bin/unrar|" \
      -e "s|^SevenZipCmd=.*$|SevenZipCmd=/storage/.kodi/addons/service.nzbget/bin/7z|" \
      -i ${ADDON_BUILD}/${PKG_ADDON_ID}/config/nzbget.conf
}
