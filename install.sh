#!/bin/bash

apt-get update
apt-get -y install apache2
adduser --disabled-password --system --home /var/lib/deluge --gecos "IamTis Deluge Server" --group deluge
touch /var/log/deluged.log
touch /var/log/deluge-web.log
chown deluge:deluge /var/log/deluge*
apt-get update
apt-get -y install deluged
apt-get -y install deluge-webui
wget --output-document="/etc/default/deluge-daemon" https://raw.githubusercontent.com/iamtis/deluge-installer/master/etc/default/deluge-daemon
wget --output-document="/etc/init.d/deluge-daemon" https://raw.githubusercontent.com/iamtis/deluge-installer/master/etc/init.d/deluge-daemon
chmod a+x /etc/init.d/deluge-daemon
update-rc.d deluge-daemon defaults
sudo rm /var/www/html/index.html
chmod 777 /var/www/html
reboot -h now
