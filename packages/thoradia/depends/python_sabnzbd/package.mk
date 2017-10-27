PKG_NAME="python_sabnzbd"
PKG_VERSION="1"
PKG_DEPENDS_TARGET="cffi"
PKG_LONGDESC="SABnzbd Python dependencies"

PKG_IS_PYTHON="yes"
PKG_PYTHON_OPTS_TARGET="--cross-compile"

pre_make_target() {
  export LDSHARED="-pthread"
  cp -r "$PKG_DIR"/python/* .
}

post_make_target() {
  rm -fr "$INSTALL"/lib/python/cffi*
  cp -r "$(get_build_dir cffi)"/.install_pkg/lib/python/*.egg \
        "$INSTALL/lib/python"
}

post_makeinstall_target() {
  rm -f "$INSTALL/lib/dummy.pyo"
}
