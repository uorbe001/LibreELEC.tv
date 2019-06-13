PKG_NAME="deluge"
PKG_VERSION="2.0.3"
PKG_SHA256="5b9831ee06126cb31e53007a2974f20c60f591367689c346ee2621429a29065c"
PKG_REV="28"
PKG_LICENSE="GPLv3"
PKG_SITE="http://deluge-torrent.org/"
PKG_URL="https://github.com/deluge-torrent/deluge/archive/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cffi libtorrent-rasterbar"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Deluge"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: lightweight, free software, cross-platform BitTorrent client"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a lightweight, free software, cross-platform BitTorrent client."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="python2"

pre_configure_target() {
  echo $PKG_VERSION > RELEASE-VERSION
  export LDSHARED="-pthread"
  python setup.py build
}

post_make_target() {
  _site=usr/lib/$PKG_PYTHON_VERSION/site-packages
  cp -r $(get_build_dir cffi)/.install_pkg/$_site/cffi-*.egg \
         $INSTALL/$_site
  cat $(get_build_dir cffi)/.install_pkg/$_site/easy-install.pth >> $INSTALL/$_site/easy-install.pth
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    for f in "deluged" "deluge-web"; do
      cp -L $PKG_BUILD/.install_pkg/usr/bin/$f $ADDON_BUILD/$PKG_ADDON_ID/bin
      sed -i "1c #!/usr/bin/env python2" $ADDON_BUILD/$PKG_ADDON_ID/bin/$f
    done

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -LR $PKG_BUILD/.install_pkg/usr/lib/* \
           $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/libtorrent-rasterbar.so.?? \
           $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/python* \
           $ADDON_BUILD/$PKG_ADDON_ID/lib
}
