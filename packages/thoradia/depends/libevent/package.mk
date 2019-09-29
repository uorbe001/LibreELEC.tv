PKG_NAME="libevent"
PKG_VERSION="2.1.11-stable"
PKG_SHA256="229393ab2bf0dc94694f21836846b424f3532585bac3468738b7bf752c03901e"
PKG_LICENSE="BSD"
PKG_SITE="http://libevent.org/"
PKG_URL="https://github.com/libevent/$PKG_NAME/archive/release-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="$PKG_NAME-release-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain openssl zlib"
PKG_SHORTDESC="libevent: a library for asynchronous event notification"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-libevent-regress \
                           --disable-samples \
                           --disable-shared \
                           --enable-static \
                           --enable-openssl"

post_makeinstall_target() {
  rm -fr "$INSTALL"
}
