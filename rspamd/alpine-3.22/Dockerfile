FROM alpine:3.22

LABEL maintainer="Florian Wilkens <docker@1wilkens.org>"
EXPOSE 11333 11334

ARG VMAIL_GID="5000"

RUN apk add --no-cache \
    rspamd \
    rspamd-controller \
    rspamd-proxy \
    ca-certificates \
    && rm -rf /var/cache/apk/*

RUN addgroup -g ${VMAIL_GID} vmail \
    && adduser rspamd vmail

RUN mkdir /run/rspamd \
    && chown rspamd:vmail /run/rspamd \
    && mkdir /etc/rspamd/dkim

USER rspamd

CMD ["/usr/bin/rspamd", "-i", "-f"]
