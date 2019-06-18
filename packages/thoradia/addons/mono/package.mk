# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mono"
PKG_VERSION="5.18.1.0"
PKG_SHA256="a92a8fb54f8faa922cdb203cf0bee93bf418f08144f5bc018c5013948d03a4f0"
PKG_REV="113"
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
         --disable-libraries \
         --without-mcs-docs \
         --without-x"

configure_host() {
  ../configure $options --host=$HOST_NAME
}

makeinstall_host() {
  :
}

configure_target() {
  ../configure $options --host=$TARGET_NAME \
                        --disable-mcs-build \
                        --with-libgdiplus=$SYSROOT_PREFIX/usr/lib
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
