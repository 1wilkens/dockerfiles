FROM alpine:3.20

LABEL maintainer="Florian Wilkens <docker@1wilkens.org>"
EXPOSE 11333
EXPOSE 11334

RUN apk add --no-cache shadow \
    rspamd \
    rspamd-controller \
    rspamd-proxy \
    ca-certificates \
    && rm -rf /var/cache/apk/*

RUN addgroup --gid 5000 vmail \
    && usermod -aG vmail rspamd

RUN mkdir /run/rspamd \
    && chown rspamd:vmail /run/rspamd \
    && mkdir /etc/rspamd/dkim

USER rspamd

CMD ["/usr/bin/rspamd", "-i", "-f"]
