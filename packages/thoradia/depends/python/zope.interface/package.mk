PKG_NAME="zope.interface"
PKG_VERSION="4.4.3"
PKG_LICENSE="ZPLv2.1"
PKG_SITE="http://zopeinterface.readthedocs.io/"
PKG_URL="https://github.com/zopefoundation/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain distutilscross:host Python"
PKG_LONGDESC="Interfaces for Python"

PKG_IS_PYTHON="yes"
PKG_PYTHON_OPTS_TARGET="--cross-compile"

post_makeinstall_target() {
  touch $INSTALL/usr/lib/python2.7/site-packages/zope/__init__.py
}
