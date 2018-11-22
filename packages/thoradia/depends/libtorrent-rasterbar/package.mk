PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1_1_11"
PKG_SHA256="d98ea107513537771ce661d17ccc16148cda1294c2d42ff4efe314482e0de441"
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
  export CXXFLAGS="$CXXFLAGS -lboost_python -lpython2.7"
}
