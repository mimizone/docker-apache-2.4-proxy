#!/bin/bash
chown www-data:www-data /www -R
mkdir -p /var/lock/apache2
mkdir -p /var/run/apache2
source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND