PKG_NAME="libtorrent"
PKG_VERSION="0.13.6"
PKG_SHA256="bf963ac6e73e194a2cd87ebdf809988b5b3d6244bb7cd43d7d0c4852fc501524"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rakshasa/libtorrent"
PKG_URL="https://github.com/rakshasa/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl zlib"
PKG_LONGDESC="libtorrent"

PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-debug \
                           --disable-shared"
