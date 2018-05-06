PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1_1_7"
PKG_SHA256="8c3b4f2cecffca07845b50217a8618f5eabdef8a8abb82f3412775c4193f7c6d"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/archive/libtorrent-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="libtorrent-libtorrent-$PKG_VERSION"
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
  export CXXFLAGS="$CXXFLAGS -lboost_python -lpython2.7"
}
