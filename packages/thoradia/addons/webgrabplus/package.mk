# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="webgrabplus"
PKG_VERSION="3.0.2_beta"
PKG_SHA256="a2388fcee909c2731adc714b8ea97720ea74d081f8d5efe08ad93ffdc0963797"
PKG_REV="113"
PKG_LICENSE="prop."
PKG_SITE="http://www.webgrabplus.com/"
PKG_URL="http://webgrabplus.com/sites/default/files/download/SW/V3.0.2/WebGrabPlus_V3.0.2_beta_install.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="WebGrab+Plus"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.mono:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a multi-site incremental xmltv epg grabber"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) collects tv-program guide data from selected tvguide sites for your favourite channels."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}
    cp -r ${PKG_BUILD}/bin \
          ${ADDON_BUILD}/${PKG_ADDON_ID}
}
