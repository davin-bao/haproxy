FROM haproxy:1.7.2-alpine

ENV HAPROXY_USER haproxy

RUN addgroup -S ${HAPROXY_USER} && \
  adduser -HDS -G ${HAPROXY_USER} ${HAPROXY_USER} && \
  mkdir -p /var/lib/${HAPROXY_USER} && \
  chown -R ${HAPROXY_USER}:${HAPROXY_USER} /var/lib/${HAPROXY_USER}

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg


CMD ["haproxy", "-db", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]