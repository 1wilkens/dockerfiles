FROM alpine:3.10

LABEL maintainer "Florian Wilkens <docker@1wilkens.org>"
EXPOSE 24 993 4190

RUN apk add --no-cache shadow \
     dovecot \
     dovecot-lmtpd \
     dovecot-pigeonhole-plugin \
     rspamd-client \
     && rm -rf /var/cache/apk/*

RUN addgroup --gid 5000 vmail \
    && adduser -h /var/mail -H -u 5000 -G vmail -D vmail

CMD ["/usr/sbin/dovecot", "-F"]
