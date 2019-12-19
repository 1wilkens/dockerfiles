FROM alpine:3.10

LABEL maintainer "Florian Wilkens <docker@1wilkens.org>"
EXPOSE 11333

RUN apk add --no-cache shadow \
    rspamd rspamd-controller rspamd-proxy ca-certificates

RUN addgroup --gid 5000 vmail \
    && usermod -aG vmail rspamd

RUN mkdir /run/rspamd \
    && mkdir /etc/rspamd/dkim

USER rspamd

CMD ["/usr/sbin/rspamd", "-i", "-f"]
