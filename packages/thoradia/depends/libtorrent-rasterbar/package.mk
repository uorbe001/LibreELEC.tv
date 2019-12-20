PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1_2_3"
PKG_SHA256="6381020213c5138adf8bcf9f5bf04ab1521d563cd8a9fa1156f1590b35ccc9d4"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/archive/libtorrent-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain boost libiconv openssl"
PKG_LONGDESC="An efficient feature complete C++ bittorrent implementation"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-python-binding \
                           --with-boost-libdir=${SYSROOT_PREFIX}/usr/lib \
                           --with-libiconv"

post_unpack() {
  mkdir -p ${PKG_BUILD}/build-aux/
    touch ${PKG_BUILD}/build-aux/config.rpath
}
