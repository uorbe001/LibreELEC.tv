#!/bin/sh

. /etc/profile
oe_setup_addon service.flexget

if [ ! -f "$ADDON_HOME/config.yml" ]; then
  cp "$ADDON_DIR/config/config.yml" "$ADDON_HOME"
fi

pythonpath="$ADDON_DIR/flexget"
for p in "$ADDON_DIR"/flexget/*; do
  pythonpath="$pythonpath:$p"
done

PYTHONPATH="$pythonpath" \
nice -n "$fg_nice" \
python "$ADDON_DIR/flexget/flexget_vanilla.py" \
       -c "$ADDON_HOME/config.yml" \
       $@
