#!/bin/sh
. /etc/os-release
. /etc/profile
oe_setup_addon service.radarr

URL="https://radarr.servarr.com/v1/update/aphrodite/updatefile?os=linux"
DIR="Radarr"

download() {
  if [ -e ${_lib} ]; then
    return
  fi
  _dst=${ADDON_DIR}/${DIR}
  rm -fr ${_dst}
  set -o pipefail
  if ! wget -qO- ${1} | tar vxzf - -C ${ADDON_DIR}; then
    exit 1
  fi
  mv ${_dst} ${_lib}
}

select_runtime() {
  case ${LIBREELEC_ARCH} in
    RPi.arm)
      use_mono
      ;;
    *.x86_64)
      use_netcore x86
      ;;
    *)
      use_netcore arm
      ;;
  esac
}

use_mono() {
  _lib=${ADDON_DIR}/mono
  _cmd="mono --debug ${_lib}/Radarr.exe"
  download "${URL}&runtime=mono"
  cert-sync --quiet --user /etc/pki/tls/cacert.pem
}

use_netcore() {
  _lib=${ADDON_DIR}/netcore
  _cmd=${_lib}/Radarr
  download "${URL}&runtime=netcore&arch=${1}"
  chmod +x ${_cmd}
  export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
}

export XDG_CONFIG_HOME="${ADDON_HOME}"
select_runtime
exec nice -n "${nice:-10}" \
${_cmd} -data=${ADDON_HOME} -nobrowser "${@}"
