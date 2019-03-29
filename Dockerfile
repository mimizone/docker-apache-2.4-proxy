FROM ubuntu:16.04
MAINTAINER Jeremy Huylebroeck <jeremy.huylebroeck@gmail.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        curl \
        apache2 && \
        rm -rf /var/lib/apt/lists/*

RUN a2enmod proxy_http proxy_ajp proxy_balancer proxy_wstunnel rewrite headers ssl
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
ADD vhost-default.conf /etc/apache2/sites-available/000-default.conf

RUN mkdir /www /conf
ADD proxy.conf /conf
ADD run.sh /run.sh
RUN chmod 755 /run.sh

EXPOSE 80
WORKDIR /www
CMD ["/run.sh"]
