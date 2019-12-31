PKG_NAME="radarr"
PKG_VERSION="3.0.0.3371"
PKG_REV="31"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Radarr/Radarr"
PKG_SOURCE_NAME="${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Radarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="virtual.thoradia-mono:0.0.0"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a fork of Sonarr to work with movies à la CouchPotato"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a fork of Sonarr to work with movies à la CouchPotato."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

if [ "${DEVICE}" == "RPi" ]; then
  arch="arm"
  runtime="mono"
  PKG_SHA256="99560fea3f4d14e059645beb38df3b8a0be5ae1b555910c357c9636ef6ad5480"
  PKG_ADDON_REQUIRES="tools.mono:0.0.0 ${PKG_ADDON_REQUIRES}"
else
  case $ARCH in
    arm)
      arch="arm"
      PKG_SHA256="4a85c69566251a81d1f2b1a7324cc06ffeb9b1006d820437812743bcdd137a26"
      ;;
    x86_64)
      arch="x64"
      PKG_SHA256="f968a95c53ff218753a0bd1668254646da5fde81930ff855f775b891badd549e"
      ;;
  esac
  runtime="netcore"
fi
PKG_URL="https://radarr.servarr.com/v1/update/aphrodite/updatefile?arch=${arch}&os=linux&runtime=${runtime}&version=${PKG_VERSION}"
PKG_SOURCE_NAME="${PKG_NAME}-${PKG_VERSION}-${runtime}-${arch}.tar.gz"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}
    cd ${PKG_BUILD}
      XZ_OPT=-9e tar -cJf ${ADDON_BUILD}/${PKG_ADDON_ID}/libs.tar.xz *
      cd -
}
