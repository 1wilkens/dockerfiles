FROM golang:1.14-alpine AS builder

RUN apk add --no-cache git

WORKDIR /go/src/github.com/poolpOrg/
RUN git clone https://github.com/poolpOrg/filter-rspamd.git

RUN cd filter-rspamd \
    && go build \
    && chmod 0555 filter-rspamd

FROM alpine:3.11

LABEL maintainer "Florian Wilkens <docker@1wilkens.org>"
EXPOSE 25 587

ENV OPENSMTPD_VERSION 6.6.4p1

# Install opensmtpd
RUN apk add --no-cache libressl \
        "opensmtpd~${OPENSMTPD_VERSION}" \
        && install -d -m 711 /var/spool/smtpd

# Copy rspamd filter from builder
COPY --from=builder /go/src/github.com/poolpOrg/filter-rspamd/filter-rspamd /usr/lib/opensmtpd/filter-rspamd

# WORKDIR + CMD
WORKDIR /var/spool/smtpd
CMD ["smtpd", "-d", "-f", "/etc/mail/smtpd.conf"]
