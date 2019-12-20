PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1_2_7"
PKG_SHA256="437d097fea1118264e8e11bac153b3c846b130f1b328560a77cb55ef6909bf87"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/archive/libtorrent_${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain boost libiconv openssl"
PKG_LONGDESC="An efficient feature complete C++ bittorrent implementation"

PKG_BUILD_FLAGS="+pic"
PKG_CMAKE_OPTS_TARGET="-Dboost-python-module-name=python \
                       -DBoost_USE_STATIC_LIBS=ON \
                       -DBUILD_SHARED_LIBS=OFF \
                       -Dpython-bindings=ON"
