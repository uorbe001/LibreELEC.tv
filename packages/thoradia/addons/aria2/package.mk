PKG_NAME="aria2"
PKG_VERSION="1.33.1"
PKG_SHA256="0616f11ef3ddd0c74be74ea2536be62ce168b99e3d6a35dea9d166b9cab9fbd1"
PKG_REV="2"
PKG_LICENSE="OpenSSL"
PKG_SITE="https://aria2.github.io/"
PKG_URL="https://github.com/aria2/$PKG_NAME/archive/release-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="$PKG_NAME-release-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libxml2 openssl sqlite zlib"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="aria2"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: the next generation download utility"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a lightweight multi-protocol and multi-source command-line download utility, which supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink, and can be manipulated via built-in JSON-RPC and XML-RPC interfaces."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="autotools"
PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"

makeinstall_target() {
  $STRIP src/aria2c
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/bin"
  cp  "$PKG_BUILD/.$TARGET_NAME/src/aria2c" \
       "$ADDON_BUILD/$PKG_ADDON_ID/bin"
}
