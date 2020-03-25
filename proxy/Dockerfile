FROM haproxy:2.0-alpine

# TODO:
RUN apk upgrade --update && \
    apk add rsyslog && \
    mkdir -p /etc/rsyslog.d/ && \
    touch /var/log/haproxy.log
