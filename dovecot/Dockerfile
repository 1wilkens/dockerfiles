FROM alpine:3.10

LABEL maintainer "Florian Wilkens <docker@1wilkens.org>"
EXPOSE 24 993 4190

RUN apk add --no-cache \
     dovecot dovecot-lmtpd dovecot-pigeonhole-plugin \
     rspamd-client

CMD ["/usr/sbin/dovecot", "-F"]
