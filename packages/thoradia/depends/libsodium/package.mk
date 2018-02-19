PKG_NAME="libsodium"
PKG_VERSION="1.0.16"
PKG_SHA256="0c14604bbeab2e82a803215d65c3b6e74bb28291aaee6236d65c699ccfe1a98c"
PKG_LICENSE="ISC"
PKG_SITE="https://libsodium.org/"
PKG_URL="https://github.com/jedisct1/libsodium/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Sodium is a modern, easy-to-use software library for encryption, decryption, signatures, password hashing and more."

PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static --with-pic"
