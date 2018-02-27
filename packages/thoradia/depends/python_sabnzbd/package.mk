PKG_NAME="python_sabnzbd"
PKG_VERSION="1"
PKG_DEPENDS_TARGET="cffi"
PKG_LONGDESC="SABnzbd Python dependencies"

PKG_TOOLCHAIN="python2"

pre_make_target() {
  export LDSHARED="-pthread"

  cat << EOF > setup.py
#!/usr/bin/env python

from setuptools import setup

setup(name='$PKG_NAME',
      version='$PKG_VERSION',
      description='$PKG_LONGDESC',
      author='thoradia',
      url='https://github.com/thoradia/LibreELEC.tv',
      install_requires=[
          "Cheetah==2.4.4",
          "Markdown==2.6.11",
          "asn1crypto==0.24.0",
          "cryptography==2.1.4",
          "enum34==1.1.6",
          "idna==2.6",
          "ipaddress==1.0.19",
          "py-notify==0.3.1",
          "sabyenc==3.3.2",
          "setuptools==38.5.1",
          "six==1.11.0",
        ],
     )
EOF
}

post_makeinstall_target() {
  _site="usr/lib/$PKG_PYTHON_VERSION/site-packages"
  cp -r "$(get_build_dir cffi)/.install_pkg/$_site"/*.egg "$INSTALL/$_site"
  cat "$(get_build_dir cffi)/.install_pkg/$_site/easy-install.pth" >> "$INSTALL/$_site/easy-install.pth"
}
