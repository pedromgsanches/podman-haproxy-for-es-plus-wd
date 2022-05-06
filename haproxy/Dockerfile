FROM haproxy:alpine3.15
COPY --chown=1001 ./conf/. /usr/local/etc/haproxy
COPY --chown=1001 ./ssl/. /etc/ssl/certs
