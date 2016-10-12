#!/bin/bash
chown www-data:www-data /www -R
source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND