# Apache 2.4 Reverse Proxy
A Docker container with Apache 2.4 installed with the following modules enabled:
- mod_proxy
  - proxy_http
  - proxy_ajp
  - proxy_balancer
  - proxy_wstunnel
  - rewrite
  - headers

This container is based upon
[/rgoyard/apache-proxy](https://hub.docker.com/r/rgoyard/apache-proxy/)