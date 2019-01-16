PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1_1_12"
PKG_SHA256="a84f68ad5656abeb90074602998d73b93588c7728b79e78f17353737b8180ef8"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/archive/libtorrent_$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain boost libiconv openssl"
PKG_LONGDESC="An efficient feature complete C++ bittorrent implementation"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-python-binding \
                           --with-boost-libdir=$SYSROOT_PREFIX/usr/lib \
                           --with-libiconv"

post_unpack() {
  mkdir -p $PKG_BUILD/build-aux/
  touch $PKG_BUILD/build-aux/config.rpath
}

pre_configure_target() {
  export CXXFLAGS="$CXXFLAGS -lboost_python27 -lpython2.7"
}
