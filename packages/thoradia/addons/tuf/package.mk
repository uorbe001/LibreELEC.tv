PKG_NAME="tuf"
PKG_VERSION="0.10.2"
PKG_REV="1"
PKG_LICENSE="ALv2"
PKG_DEPENDS_TARGET="cffi libsodium"
PKG_SECTION="tools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="The Update Framework"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: a framework for securing software update systems"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) helps developers to secure new or existing software update systems, which are often found to be vulnerable to many known attacks. TUF addresses this widespread problem by providing a comprehensive, flexible security framework that developers can integrate with any software update system."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="python2"

pre_make_target() {
  export LDSHARED="-pthread"
  export SODIUM_INSTALL="system"

  cat << EOF > setup.py
#!/usr/bin/env python

from setuptools import setup

setup(name='le_tuf',
      version='$PKG_VERSION',
      install_requires=[
          "PyNaCl==1.2.1",
          "asn1crypto==0.24.0",
          "colorama==0.3.9",
          "cryptography==2.1.4",
          "enum34==1.1.6",
          "idna==2.6",
          "ipaddress==1.0.19",
          "iso8601==0.1.12",
          "natsort==5.2.0",
          "pycryptodome==3.4.11",
          "securesystemslib==0.10.10",
          "six==1.11.0",
          "tuf==0.10.2",
        ],
     )
EOF
}

post_makeinstall_target() {
  rm -rf $_pythonpath/pycryptodome-*.egg/Crypto/SelfTest
  ln -sfr $_pythonpath/pycryptodome-*.egg $_pythonpath/Cryptodome.egg
  echo "./Cryptodome.egg" >> $_pythonpath/easy-install.pth
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID"

  cp -PR "$PKG_BUILD/.install_pkg/usr/lib" \
         "$ADDON_BUILD/$PKG_ADDON_ID"
}
