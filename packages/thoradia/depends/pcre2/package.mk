PKG_NAME="pcre2"
PKG_VERSION="10.33"
PKG_SHA256="35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e379eabb75f789d8aa"
PKG_LICENSE="BSD"
PKG_SITE="http://www.pcre.org/"
PKG_URL="https://ftp.pcre.org/pub/pcre/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The PCRE library is a set of functions that implement regular expression pattern matching using the same syntax and semantics as Perl 5. PCRE has its own native API, as well as a set of wrapper functions that correspond to the POSIX regular expression API. The PCRE library is free, even for building commercial software."
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_HOST="--prefix=$TOOLCHAIN \
             --enable-utf8 \
             --enable-unicode-properties \
             --with-gnu-ld"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
             --enable-static \
             --enable-utf8 \
             --enable-pcre2-16 \
             --enable-unicode-properties \
             --with-gnu-ld"

pre_configure_target() {
  CFLAGS="$CFLAGS -fPIC"
  CXXFLAGS="$CXXFLAGS -fPIC"
  LDFLAGS="$LDFLAGS -fPIC"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  sed -e "s:\(['= ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" -i $SYSROOT_PREFIX/usr/bin/$PKG_NAME-config
}
