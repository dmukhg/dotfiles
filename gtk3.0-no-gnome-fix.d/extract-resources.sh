#!/bin/bash
GR_FILE="/usr/share/themes/Adwaita/gtk-3.0/gtk.gresource"
GR_BASEDIR="/org/gnome/adwaita/"
mkdir /usr/share/themes/Adwaita/gtk-3.0/files
cd /usr/share/themes/Adwaita/gtk-3.0/files || exit

# Extract the resources
for RSRC in $(gresource list $GR_FILE); do
  RSRC_FILE=$(echo "${RSRC#$GR_BASEDIR}")
  mkdir -p $(dirname "$RSRC_FILE") ||:
  gresource extract "$GR_FILE" "$RSRC" > "$RSRC_FILE"
done
