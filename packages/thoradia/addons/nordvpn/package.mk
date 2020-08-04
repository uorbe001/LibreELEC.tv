PKG_NAME="nordvpn"
PKG_VERSION="3.7.4"
PKG_REV="1"
PKG_LICENSE="Prop."
PKG_SITE="https://nordvpn.com/"
PKG_DEPENDS_TARGET="toolchain libxslt"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="NordVPN"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: protect your privacy online and access media content with no regional restrictions"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) protect your privacy online and access media content with no regional restrictions, strong encryption and no-log policy with 3000+ servers in 60+ countries."
PKG_DISCLAIMER="Keep it legal and carry on"

case ${ARCH} in
  arm)
    arch="armhf"
    PKG_SHA256="b8536315657a5c5eebf0356346a760e01b5f339eb43caeef15eacdc34919aff0"
    ;;
  x86_64)
    arch="amd64"
    PKG_SHA256="83cb21463bc6a69020aed1d3aec1c490ca1430d9e9ea57575cd5dc8b9a93910b"
    ;;
esac

PKG_URL="https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${PKG_VERSION}_${arch}.deb"
PKG_SOURCE_NAME=nordvpn_${PKG_VERSION}_${arch}.deb

unpack() {
  :
}

make_target() {
  ar x ${SOURCES}/${PKG_NAME}/${PKG_SOURCE_NAME}
  tar xf data.tar.xz
  echo ${PKG_REV} > var/lib/nordvpn/version
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR ${PKG_BUILD}/usr/bin/* \
           ${PKG_BUILD}/usr/sbin/* \
           $(get_build_dir libxslt)/.${TARGET_NAME}/xsltproc/xsltproc \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR ${PKG_BUILD}/var/lib/nordvpn \
           ${ADDON_BUILD}/${PKG_ADDON_ID}

}
