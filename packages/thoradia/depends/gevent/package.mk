PKG_NAME="gevent"
PKG_VERSION="1.1.2"
PKG_SHA256="93ba5d611142ab0e1d0be17466ff6a06275ad88064801b59f5ecab3c6ada2e65"
PKG_LICENSE="MIT"
PKG_SITE="http://www.gevent.org/"
PKG_URL="https://github.com/gevent/gevent/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="distutilscross:host Python2 cython"
PKG_LONGDESC="Coroutine-based concurrency library for Python"
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  export LDSHARED="$CC -shared"
  export PATH="$(get_build_dir cython)/bin:$PATH"
  export PYTHONPATH="$(get_build_dir cython):$PYTHONPATH"
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export TARGET_CONFIGURE_OPTS
}

make_target() {
  python setup.py build
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
  find . -name "*.py" -exec rm -rf "{}" ";"
}
