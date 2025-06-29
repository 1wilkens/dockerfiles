FROM golang:1.24-alpine AS builder

RUN apk add --no-cache git

WORKDIR /go/src/github.com/poolpOrg/
RUN git clone https://github.com/poolpOrg/filter-rspamd.git

RUN cd filter-rspamd \
    && go build \
    && chmod 0555 filter-rspamd

FROM alpine:3.22

LABEL maintainer="Florian Wilkens <docker@1wilkens.org>"
EXPOSE 25 587

# Install opensmtpd
RUN apk add --no-cache \
        opensmtpd \
        && rm -rf /var/cache/apk/* \
        && install -d -m 711 /var/spool/smtpd

# Copy rspamd filter from builder
COPY --from=builder /go/src/github.com/poolpOrg/filter-rspamd/filter-rspamd /usr/lib/opensmtpd/filter-rspamd

# WORKDIR + CMD
WORKDIR /var/spool/smtpd
CMD ["smtpd", "-d", "-f", "/etc/mail/smtpd.conf"]
