#!/bin/sh
. /etc/os-release
. /etc/profile
oe_setup_addon service.radarr

_dst=${ADDON_DIR}/libs
_src=${_dst}.tar.xz
if [ -f ${_src} ]; then
  echo "Installing Radarr"
  mkdir -p ${_dst}
  if ! tar xJf ${_src} -C ${_dst}; then
    echo "Installation failed"
    exit 1
  fi
  rm -f ${_src}
  chmod +x ${_dst}/Radarr
  echo "Installation succeeded"
fi

export XDG_CONFIG_HOME=${ADDON_HOME}

if [ "${LIBREELEC_DEVICE}" == "RPi" ]; then
  cert-sync --quiet --user /etc/pki/tls/cacert.pem
  exec nice -n "${nice:-10}" \
  mono --debug ${ADDON_DIR}/libs/Radarr.exe -data=${ADDON_HOME} -nobrowser "${@}"
else
  DOTNET_SYSTEM_GLOBALIZATION_INVARIANT="1" \
  exec nice -n "${nice:-10}" \
  ${ADDON_DIR}/libs/Radarr -data=${ADDON_HOME} -nobrowser "${@}"
fi
