#!/bin/bash

while : ; do
    [[ -f "/var/lib/deluge/config/deluge/core.conf" ]] && break
    echo "Pausing until file exists."
    sleep 1
done
rm /var/lib/deluge/config/deluge/core.conf
wget --output-document="/var/lib/deluge/config/deluge/core.conf" https://raw.githubusercontent.com/iamtis/deluge-installer/master/var/lib/deluge/config/deluge/core.conf
reboot -h now
