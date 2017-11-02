PKG_NAME="python_common"
PKG_VERSION="1"
PKG_DEPENDS_TARGET="cffi libxslt"
PKG_LONGDESC="Common Python dependencies"

PKG_IS_PYTHON="yes"

pre_make_target() {
  export CFLAGS="$CFLAGS -L$SYSROOT_PREFIX/usr/lib"
  export LDSHARED="-pthread"

  touch dummy.py

  cat << EOF > setup.py
#!/usr/bin/env python

from setuptools import setup

setup(name='$PKG_NAME',
      version='$PKG_VERSION',
      description='$PKG_LONGDESC',
      author='thoradia',
      url='https://github.com/thoradia/LibreELEC.tv',
      py_modules = ['dummy'],
      install_requires=[
          "asn1crypto==0.23.0",
          "cryptography==2.1.2",
          "enum34==1.1.6",
          "idna==2.6",
          "ipaddress==1.0.18",
          "lxml==4.1.0",
          "pyOpenSSL==17.3.0",
          "setuptools==36.6.0",
          "six==1.11.0",
        ],
     )
EOF
}

post_make_target() {
  cp -r "$(get_build_dir cffi)"/.install_pkg/lib/*.egg "$INSTALL/lib"
}
