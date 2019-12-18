FROM alpine:3.10

LABEL maintainer "Florian Wilkens <docker@1wilkens.org>"
EXPOSE 11333

RUN apk add --no-cache rspamd rspamd-controller rspamd-proxy ca-certificates

RUN mkdir /run/rspamd \
    && mkdir /etc/rspamd/dkim

USER rspamd

CMD ["/usr/sbin/rspamd", "-i", "-f"]
