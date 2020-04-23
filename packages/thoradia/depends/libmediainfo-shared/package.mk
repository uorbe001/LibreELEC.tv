PKG_NAME="libmediainfo-shared"
PKG_VERSION="20.03"
PKG_SHA256="2a1da41b94aa5380c537f198f3c797fd9ef23891709e935143e4535099437311"
PKG_LICENSE="GPL"
PKG_SITE="http://mediaarea.net/en/MediaInfo/Download/Source"
PKG_URL="https://github.com/MediaArea/MediaInfoLib/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libzen zlib"
PKG_LONGDESC="MediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files"
PKG_TOOLCHAIN="manual"

configure_target() {
  CXXFLAGS="${CXXFLAGS} -lpthread -lzen"
  cd Project/GNU/Library
    do_autoreconf
    ./configure \
          --host=${TARGET_NAME} \
          --build=${HOST_NAME} \
          --disable-static \
          --enable-shared \
          --prefix=/usr \
          --enable-visibility
}

make_target() {
    make
}
