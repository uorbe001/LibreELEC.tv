PKG_NAME="btfs"
PKG_VERSION="2.20"
PKG_SHA256="ab85d10407d210c367dc5a0db6aa9e8620ebbb819c58da783ca343dfa8577441"
PKG_REV="2"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/johang/btfs"
PKG_URL="https://github.com/johang/$PKG_NAME/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain curl fuse libtorrent-rasterbar"
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="btfs"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_MAINTAINER="thoradia"
PKG_SECTION="tools"
PKG_SHORTDESC="$PKG_ADDON_NAME: bittorrent filesystem based on FUSE"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a bittorrent filesystem based on FUSE."
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/lib"

  cp -PR "$PKG_BUILD/.install_pkg/usr/bin" \
         "$ADDON_BUILD/$PKG_ADDON_ID"

  cp -LR "$(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib"/libtorrent-rasterbar.so.?? \
         "$ADDON_BUILD/$PKG_ADDON_ID/lib"
}
