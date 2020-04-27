#!/bin/bash

set -e

IMAGE="1wilkens/opensmtpd"

for alpine_version in */; do
    cd $alpine_version
    opensmtpd_version="$(grep 'ENV OPENSMTPD_VERSION' Dockerfile | cut -d' ' -f3)"

    echo "## Building ${IMAGE}:${opensmtpd_version} based on alpine:${alpine_version%/}"
    docker build --pull -t "${IMAGE}:${opensmtpd_version}" .
done
