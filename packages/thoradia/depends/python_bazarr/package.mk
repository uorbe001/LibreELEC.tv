PKG_NAME="python_bazarr"
PKG_VERSION="1"
PKG_LONGDESC="Bazarr Python dependencies"

PKG_TOOLCHAIN="python2"

pre_configure_target() {
  cat << EOF > setup.py
#!/usr/bin/env python

from setuptools import setup

setup(name='$PKG_NAME',
      version='$PKG_VERSION',
      description='$PKG_LONGDESC',
      author='thoradia',
      url='https://github.com/thoradia/LibreELEC.tv',
      install_requires=[
          "greenlet==0.4.15",
        ],
     )
EOF
}
