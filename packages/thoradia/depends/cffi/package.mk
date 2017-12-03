PKG_NAME="cffi"
PKG_VERSION="1.11.2"
PKG_SHA256="ab87dd91c0c4073758d07334c1e5f712ce8fe48f007b86f8238773963ee700a6"
PKG_LICENSE="MIT"
PKG_SITE="http://cffi.readthedocs.io/"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="libffi:host"
PKG_DEPENDS_TARGET="cffi:host libffi"
PKG_LONGDESC="Foreign Function Interface for Python calling C code"

PKG_TOOLCHAIN="python2"

post_makeinstall_target() {
  rm "$INSTALL/usr/lib/$PKG_PYTHON_VERSION"/site-packages/cffi-*.egg/EGG-INFO/requires.txt
}
