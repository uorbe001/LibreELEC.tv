PKG_NAME="asn1crypto"
PKG_VERSION="0.23.0"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/wbond/asn1crypto"
PKG_URL="https://github.com/wbond/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="Python ASN.1 library with a focus on performance and a pythonic API"

make_target() {
  export LDSHARED="$CC -shared"
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*.egg-info \
         $INSTALL/usr/lib/python*/site-packages/*/tests
}
