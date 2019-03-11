PKG_NAME="jackett"
PKG_VERSION="0.11.8"
PKG_REV="36"
PKG_LICENSE="GPL2"
PKG_SITE="https://github.com/Jackett/Jackett"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"

case "$ARCH" in
  "arm")
    PKG_SHA256="e2eeb85654c3538d51f29d48559e5b4cd4732b1523cd7db2309be18d0d6ad67a"
    PKG_URL="https://github.com/Jackett/Jackett/releases/download/v$PKG_VERSION/Jackett.Binaries.LinuxARM32.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="ff97b96d959d7a630bc38686c0a73caf9eb7aa8dccfb7eb206915f571a846f5a"
    PKG_URL="https://github.com/Jackett/Jackett/releases/download/v$PKG_VERSION/Jackett.Binaries.LinuxAMDx64.tar.gz"
    ;;
esac

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Jackett"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.dotnet-runtime:0.0.0"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: proxy to tracker sites"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) works as a proxy server: it translates queries from applications (CouchPotato, Mylar, SickRage, Sonarr,  etc.) into tracker-site-specific HTTP queries, parses the HTML response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping and translation logic, removing the burden from other applications."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_TOOLCHAIN="manual"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/jackett
  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/jackett
}
