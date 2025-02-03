FROM alpine:3.21

LABEL maintainer="Florian Wilkens <docker@1wilkens.org>"
EXPOSE 24 993 4190

ARG VMAIL_UID="5000"
ARG VMAIL_GID="5000"

RUN apk add --no-cache \
     dovecot \
     dovecot-lmtpd \
     dovecot-pigeonhole-plugin \
     rspamd-client \
     && rm -rf /var/cache/apk/*

RUN addgroup -S -g ${VMAIL_GID} vmail \
    && adduser -S -D -H -u ${VMAIL_UID} -h /var/mail -s /sbin/nologin -G vmail -g vmail vmail

CMD ["/usr/sbin/dovecot", "-F"]
