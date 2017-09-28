PKG_NAME="cryptography"
PKG_VERSION="2.0.3"
PKG_LICENSE="BSD"
PKG_SITE="https://cryptography.io/"
PKG_URL="https://github.com/pyca/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cffi:host Python"
PKG_LONGDESC="A package designed to expose cryptographic primitives and recipes to Python developers"

PKG_IS_PYTHON="yes"
PKG_PYTHON_DEPENDS_TARGET="asn1crypto cffi enum34 idna ipaddress six"
PKG_PYTHON_OPTS_TARGET="--cross-compile"

pre_configure_target() {
  export CC="$CC -pthread"
}
