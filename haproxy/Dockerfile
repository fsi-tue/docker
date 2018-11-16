FROM haproxy:1.8-alpine

RUN apk upgrade --update && \
    apk add rsyslog && \
    mkdir -p /etc/rsyslog.d/ && \
    touch /var/log/haproxy.log

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
