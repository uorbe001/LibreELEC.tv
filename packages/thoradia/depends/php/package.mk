PKG_NAME="php"
PKG_VERSION="7.1.11"
PKG_SHA256="074093e9d7d21afedc5106904218a80a47b854abe368d2728ed22184c884893e"
PKG_LICENSE="PHP"
PKG_SITE="http://www.php.net"
PKG_URL="http://www.php.net/distributions/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain curl pcre"
PKG_LONGDESC="The PHP Interpreter"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-all \
                           --disable-cli \
                           --disable-phpdbg \
                           --enable-cgi \
                           --enable-json \
                           --with-curl=$SYSROOT_PREFIX/usr \
                           --with-openssl=$SYSROOT_PREFIX/usr \
                           --with-pcre-regex \
                           --with-zlib=$SYSROOT_PREFIX/usr"

pre_configure_target() {
  strip_lto
  export CFLAGS="$CFLAGS -pthread"
}

makeinstall_target() {
  mkdir -p "$INSTALL/usr/bin"
  cp "sapi/cgi/php-cgi" "$INSTALL/usr/bin/php"
}
