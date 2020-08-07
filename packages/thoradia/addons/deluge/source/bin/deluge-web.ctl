#!/bin/sh
. /etc/profile
oe_setup_addon service.deluge

PYTHONPATH=${ADDON_DIR}/libs \
exec nice -n "${nice:-10}" \
python ${ADDON_DIR}/libs/bin/deluge-web -c ${ADDON_HOME} "${@}"
