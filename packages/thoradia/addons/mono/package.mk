# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mono"
PKG_VERSION="6.4.0.198"
PKG_SHA256="d00852822525e36f9f8b3e0f537d3a41c7a718cac22d06fc63ea64988877c2ea"
PKG_REV="115"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://www.mono-project.com"
PKG_URL="http://download.mono-project.com/sources/mono/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain mono:host sqlite zlib"
PKG_SECTION="tools"
PKG_SHORTDESC="Mono: a cross platform, open source .NET framework"
PKG_LONGDESC="Mono ($PKG_VERSION) is a software platform designed to allow developers to easily create cross platform applications part of the .NET Foundation."
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Mono"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"

prefix=/storage/.kodi/addons/$PKG_SECTION.$PKG_NAME
options="--build=$HOST_NAME \
         --prefix=$prefix \
         --bindir=$prefix/bin \
         --sbindir=$prefix/sbin \
         --sysconfdir=$prefix/etc \
         --libexecdir=$prefix/lib \
         --localstatedir=/var \
         --disable-boehm \
         --with-shared-mono=no \
         --without-mcs-docs"

configure_host() {
  ../configure $options --host=$HOST_NAME
}

makeinstall_host() {
  :
}

configure_target() {
  ../configure $options --host=$TARGET_NAME \
                        --disable-mcs-build
}

makeinstall_target() {
  make -C $PKG_BUILD/.$HOST_NAME install DESTDIR=$INSTALL
  make -C $PKG_BUILD/.$TARGET_NAME install DESTDIR=$INSTALL
  $STRIP $INSTALL$prefix/bin/* $INSTALL/$prefix/lib/* &> /dev/null || true
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
  cd $PKG_BUILD/.install_pkg$prefix
    XZ_OPT=-9e tar -cJf $ADDON_BUILD/$PKG_ADDON_ID/$PKG_SECTION.$PKG_NAME.tar.xz *
  cd -
}
