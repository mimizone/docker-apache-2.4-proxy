#!/bin/bash
chown www-data:www-data /www -R

#SSL
if [ ! -d /etc/apache2/ssl ]; then
    echo GENERATING SSL CERTIFICATES
    if [ -z ${SSL_SUBJ} ]; then
        SSL_SUBJ="/C=US/L=Location/O=Organization/OU=Unit/CN=localhost"
    fi
    echo OPENSSL SUBJ set to ${SSL_SUBJ}
    mkdir /etc/apache2/ssl
    openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -out /etc/apache2/ssl/server.crt -keyout /etc/apache2/ssl/server.key  -subj ${SSL_SUBJ}
    # openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -out /etc/apache2/ssl/server.crt -keyout /etc/apache2/ssl/server.key  -subj "/C=FR/L=Paris/O=Orange/OU=DIOD/CN=haproxy-gin.intradiod"
fi


mkdir -p /var/lock/apache2
mkdir -p /var/run/apache2
source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND