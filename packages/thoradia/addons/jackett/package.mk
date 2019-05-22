PKG_NAME="jackett"
PKG_VERSION="0.11.355"
PKG_REV="39"
PKG_LICENSE="GPL2"
PKG_SITE="https://github.com/Jackett/Jackett"
PKG_DEPENDS_TARGET="toolchain curl curl3 krb5 lttng-ust"
PKG_SECTION="service"

case "$ARCH" in
  "arm")
    PKG_SHA256="28fd68c66f840e343a07eaa141e2f2f2819e887180134532e4df2a6c8e8c3459"
    PKG_URL="https://github.com/Jackett/Jackett/releases/download/v0.11.355/Jackett.Binaries.LinuxARM32.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="b8c1a5269340069fc27b636797f750ded911dfa29ef9c7499b46ae66535bdc8b"
    PKG_URL="https://github.com/Jackett/Jackett/releases/download/v0.11.355/Jackett.Binaries.LinuxAMDx64.tar.gz"
    ;;
esac

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jackett"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: proxy to tracker sites"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) works as a proxy server: it translates queries from applications (CouchPotato, Mylar, SickRage, Sonarr,  etc.) into tracker-site-specific HTTP queries, parses the HTML response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping and translation logic, removing the burden from other applications."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="manual"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/jackett
  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/jackett

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/libs
  cp -L $(get_build_dir curl3)/.install_pkg/usr/lib/libcurl.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libcom_err.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libgssapi_krb5.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libk5crypto.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libkrb5.so.? \
        $(get_build_dir krb5)/.install_pkg/usr/lib/libkrb5support.so.? \
        $(get_build_dir lttng-ust)/.install_pkg/usr/lib/liblttng-ust.so.? \
        $(get_build_dir lttng-ust)/.install_pkg/usr/lib/liblttng-ust-tracepoint.so.? \
        $ADDON_BUILD/$PKG_ADDON_ID/libs
}
