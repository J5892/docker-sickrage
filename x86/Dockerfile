FROM alpine:3.6
MAINTAINER Erik de Vries <docker@erikdevries.nl>

RUN apk -U update && \
    apk -U upgrade && \
    apk -U add \
        git \
        python \
        py-openssl \
        py-lxml \
    && \
    git clone --depth 1 https://github.com/SickRage/SickRage.git /SickRage && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

VOLUME ["/config", "/data", "/tvshows", "/downloads"]

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 8081

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
