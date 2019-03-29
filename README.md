# Apache 2.4 Reverse Proxy
A Docker container with Apache 2.4 installed with the following modules enabled:
- mod_proxy
  - proxy_http
  - proxy_ajp
  - proxy_balancer
  - proxy_wstunnel
  - rewrite
  - headers
  - ssl

This container is based upon
[/rgoyard/apache-proxy](https://hub.docker.com/r/rgoyard/apache-proxy/)

The server includes all the `*.conf` file in `/conf/`

Put your proxy configuration in for example a `proxy.conf` file as such
```
SSLProxyEngine On
ProxyPass / https://endpoint/
ProxyPassReverse / https://endpoint/
#optional proxy to reach the endpoint
ProxyRemote https://endpoint http://otherproxy:3128
```

The container creates self-signed SSL certificates when it is started if the folder `/etc/apache2/ssl` doesn't exist.
Your own existing certificates can be mounted in that folder as well.They should be named as followed:
```
/etc/apache2/ssl/server.crt
/etc/apache2/ssl/server.key
```

# build the image
```
docker build -t aproxy .
```

mount this file while running the container
```
docker run -dit --restart unless-stopped --name knoxproxy -p 8080:80 -p 8443:443 -v `pwd`/proxy.conf:/conf/proxy.conf aproxy 
```
