# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libgdiplus"
PKG_VERSION="6.0.2"
PKG_SHA256="d605bf548affd29bd0418001ffb1bb8c1bf9962c1c37c23744abb0194a099232"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/mono/libgdiplus"
PKG_URL="https://github.com/mono/libgdiplus/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cairo giflib glib libjpeg-turbo tiff"
PKG_LONGDESC="An Open Source implementation of the GDI+ API"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-shared               \
                           --with-libgif=$TARGET_PREFIX  \
                           --with-libjpeg=$TARGET_PREFIX \
                           --with-libtiff=$TARGET_PREFIX"

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libXext libexif"
else
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --without-x11"
fi

makeinstall_target() {
  make install DESTDIR=$INSTALL
}
