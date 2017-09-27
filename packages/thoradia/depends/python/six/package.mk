PKG_NAME="six"
PKG_VERSION="1.11.0"
PKG_LICENSE="MIT"
PKG_SITE="http://pypi.python.org/pypi/six/"
PKG_URL="https://github.com/benjaminp/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host"
PKG_LONGDESC="Python 2 and 3 compatibility utilities"

make_target() {
  export LDSHARED="$CC -shared"
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
}
