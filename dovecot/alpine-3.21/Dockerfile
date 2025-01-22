FROM alpine:3.21

LABEL maintainer="Florian Wilkens <docker@1wilkens.org>"
EXPOSE 24 993 4190

ARG VMAIL_UID="5000"
ARG VMAIL_GID="5000"

RUN apk add --no-cache shadow \
     dovecot \
     dovecot-lmtpd \
     dovecot-pigeonhole-plugin \
     rspamd-client \
     && rm -rf /var/cache/apk/*

RUN addgroup --gid ${VMAIL_GID} vmail \
    && adduser -h /var/mail -H -u ${VMAIL_UID} -G vmail -D vmail

CMD ["/usr/sbin/dovecot", "-F"]
