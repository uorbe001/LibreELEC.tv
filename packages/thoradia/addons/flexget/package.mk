PKG_NAME="flexget"
PKG_VERSION="2.11.3"
PKG_SHA256="0c3875ddacf7e3f7e5cc35edc5ab48cf99c29dcb3dec6c8210e9a5045046d503"
PKG_REV="2"
PKG_SITE="https://flexget.com"
PKG_URL="https://github.com/Flexget/Flexget/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Flexget-$PKG_VERSION"
PKG_DEPENDS_TARGET="libyaml"
PKG_SECTION="service"
PKG_TOOLCHAIN="python2"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="FlexGet"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: automate downloading or processing content from different sources"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a program aimed to automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."
PKG_DISCLAIMER="Keep it legal and carry on"

pre_make_target() {
  echo "setuptools==36.8.0" >> requirements.txt
}

post_makeinstall_target() {
  cp -PR "$(get_build_dir Python2)/Lib/lib2to3" \
         "$INSTALL/usr/lib/$PKG_PYTHON_VERSION/site-packages"

  rm -fr "$INSTALL/usr/lib/$PKG_PYTHON_VERSION/site-packages"/FlexGet*.egg/flexget/plugins
  cp -PR "$PKG_BUILD/flexget/plugins" \
         "$INSTALL/usr/lib/$PKG_PYTHON_VERSION/site-packages"/FlexGet*.egg/flexget
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/bin"

  cp -PR "$PKG_BUILD/flexget_vanilla.py" \
         "$ADDON_BUILD/$PKG_ADDON_ID/bin"
 
  cp -PR "$PKG_BUILD/.install_pkg/usr/lib" \
         "$ADDON_BUILD/$PKG_ADDON_ID"
}
