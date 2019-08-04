PKG_NAME="xmlrpc-c"
PKG_VERSION="1.51.03"
PKG_SHA256="82f9a4f6dee03f6a58921d75a65949dd4f0036a4c268bce6a4343338932ec065"
PKG_LICENSE="GPL"
PKG_SITE="http://xmlrpc-c.sourceforge.net"
PKG_URL="http://download.sourceforge.net/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tgz"
PKG_DEPENDS_TARGET="toolchain curl libxml2"
PKG_LONGDESC="A lightweight RPC library based on XML and HTTP"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="have_curl_config=yes \
                           have_xml2_config=yes \
                           --disable-abyss-server \
                           --disable-cgi-server \
                           --disable-cplusplus \
                           --disable-libwww-client \
                           --disable-wininet-client \
                           --enable-libxml2-backend"

pre_configure_target() {
  export CURL_CONFIG="$SYSROOT_PREFIX/usr/bin/curl-config"
  export XML2_CONFIG="$SYSROOT_PREFIX/usr/bin/xml2-config"
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME
}

post_makeinstall_target() {
  sed -i "s:\"/usr/include:\"$LIB_PREFIX/include:g" $SYSROOT_PREFIX/usr/bin/xmlrpc-c-config
  sed -i "s:\"/usr/lib:\"$LIB_PREFIX/lib:g" $SYSROOT_PREFIX/usr/bin/xmlrpc-c-config
  sed -i "s:xml2-config:$LIB_PREFIX/bin/xml2-config:g" $SYSROOT_PREFIX/usr/bin/xmlrpc-c-config
}
