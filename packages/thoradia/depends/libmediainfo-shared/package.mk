PKG_NAME="libmediainfo-shared"
PKG_VERSION="18.12"
PKG_SHA256="e8f88fe9ab1ded093bd1c1e057e5633b5768479b6cd1327b9174361f78d77ca7"
PKG_LICENSE="GPL"
PKG_SITE="http://mediaarea.net/en/MediaInfo/Download/Source"
PKG_URL="https://github.com/MediaArea/MediaInfoLib/archive/v$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="MediaInfoLib-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libzen zlib"
PKG_SHORTDESC="MediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files"
PKG_TOOLCHAIN="make"

make_target() {
  CXXFLAGS="$CXXFLAGS -lpthread -lzen"
  cd Project/GNU/Library
  do_autoreconf
  ./configure \
        --host=$TARGET_NAME \
        --build=$HOST_NAME \
        --disable-static \
        --enable-shared \
        --prefix=/usr \
        --enable-visibility \
        --with-gnu-ld \
        --without-libcurl \
        --without-libmms
  make
}
