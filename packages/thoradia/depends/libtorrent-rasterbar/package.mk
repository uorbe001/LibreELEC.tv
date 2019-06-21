PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1_1_13"
PKG_SHA256="b88d043a4f56eb5b48ae219783029d7f6cff24401161d2f054aef96286ce912b"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/archive/libtorrent-$PKG_VERSION.tar.gz"
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
