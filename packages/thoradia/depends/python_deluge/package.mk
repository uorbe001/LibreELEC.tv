PKG_NAME="python_deluge"
PKG_VERSION="1"
PKG_DEPENDS_TARGET="cffi"
PKG_LONGDESC="SABnzbd Python dependencies"

PKG_IS_PYTHON="yes"

pre_make_target() {
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
          "Automat==0.6.0",
          "Mako==1.0.7",
          "MarkupSafe==1.0",
          "Twisted==17.9.0",
          "argparse==1.4.0",
          "asn1crypto==0.23.0",
          "attrs==17.2.0",
          "chardet==3.0.4",
          "constantly==15.1.0",
          "cryptography==2.1.2",
          "enum34==1.1.6",
          "hyperlink==17.3.1",
          "idna==2.6",
          "incremental==17.5.0",
          "ipaddress==1.0.18",
          "linecache2==1.0.0",
          "pyOpenSSL==17.3.0",
          "pyasn1-modules==0.1.5",
          "pyasn1==0.3.7",
          "python-gettext==2.1",
          "pyxdg==0.25",
          "service_identity==17.0.0",
          "setuptools==36.6.0",
          "six==1.11.0",
          "traceback2==1.4.0",
          "unittest2==1.1.0",
          "zope.interface==4.4.3",
        ],
     )
EOF
}

post_make_target() {
  cp -r "$(get_build_dir cffi)"/.install_pkg/lib/*.egg "$INSTALL/lib"
}
