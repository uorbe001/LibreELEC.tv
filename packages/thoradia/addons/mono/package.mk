# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mono"
PKG_VERSION="5.8.1.0"
PKG_SHA256="a25ed4c8c4623ebae77dd307e7aca874f84f310d5cad1ff9454b3813a7f1cc39"
PKG_REV="111"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://www.mono-project.com"
PKG_URL="http://download.mono-project.com/sources/mono/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain mono:host libgdiplus sqlite zlib"
PKG_SECTION="tools"
PKG_SHORTDESC="Mono: a cross platform, open source .NET framework"
PKG_LONGDESC="Mono ($PKG_VERSION) is a software platform designed to allow developers to easily create cross platform applications part of the .NET Foundation"
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Mono"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_MAINTAINER="thoradia"

prefix="/storage/.kodi/addons/$PKG_SECTION.$PKG_NAME"
options="--build=$HOST_NAME \
         --prefix=$prefix \
         --bindir=$prefix/bin \
         --sbindir=$prefix/sbin \
         --sysconfdir=$prefix/etc \
         --libexecdir=$prefix/lib \
         --localstatedir=/var \
         --disable-boehm \
         --disable-libraries \
         --without-mcs-docs"

configure_host() {
  cp -PR ../* .
  ./configure $options --host=$HOST_NAME
}

makeinstall_host() {
  : # nop
}

configure_target() {
  cp -PR ../* .
  ./configure $options --host=$TARGET_NAME \
                       --disable-mcs-build
}

makeinstall_target() {
  make -C "$PKG_BUILD/.$HOST_NAME" install DESTDIR="$INSTALL"
  make -C "$PKG_BUILD/.$TARGET_NAME" install DESTDIR="$INSTALL"
  $STRIP "$INSTALL/storage/.kodi/addons/$PKG_SECTION.$PKG_NAME/bin/mono"
}

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID"

  cp -PR "$PKG_BUILD/.install_pkg/storage/.kodi/addons/$PKG_SECTION.$PKG_NAME"/* \
         "$ADDON_BUILD/$PKG_ADDON_ID/"

  rm -fr "$ADDON_BUILD/$PKG_ADDON_ID/include" \
         "$ADDON_BUILD/$PKG_ADDON_ID/share/man"

  mv "$ADDON_BUILD/$PKG_ADDON_ID/bin/mono-sgen" \
     "$ADDON_BUILD/$PKG_ADDON_ID/bin/mono"

  cp -L "$(get_build_dir cairo)/.install_pkg/usr/lib/libcairo.so.2" \
        "$(get_build_dir libgdiplus)/.install_pkg/usr/lib/libgdiplus.so" \
        "$(get_build_dir pixman)/.install_pkg/usr/lib/libpixman-1.so.0" \
        "$ADDON_BUILD/$PKG_ADDON_ID/lib"
}
