FROM hypriot/rpi-alpine:3.6
MAINTAINER Erik de Vries <docker@erikdevries.nl>

RUN apk -U update && \
    apk -U upgrade && \
    apk -U add \
        git \
        python \
        py-openssl \
        py-lxml \
	py-pip

RUN git clone https://github.com/SiCKRAGETV/SiCKRAGE.git /SickRage && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/* && \
    cd /SickRage && \
    pip install -r requirements.txt

VOLUME ["/config", "/data", "/tvshows", "/downloads"]

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 8081

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
