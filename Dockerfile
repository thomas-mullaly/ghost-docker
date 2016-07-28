FROM alpine:3.3
MAINTAINER Thomas Mullaly <thomas.mullaly@gmail.com>

ENV GHOST_VERSION 0.9.0
ENV GHOST_SOURCE /usr/src/app
ENV GHOST_CONTENT /var/lib/ghost

WORKDIR $GHOST_SOURCE

RUN apk upgrade \
  && apk add --no-cache nodejs tar \
  && apk add --update --repository https://dl-3.alpinelinux.org/alpine/edge/community/ tini \
  && apk --no-cache add --virtual dev g++ make python wget unzip ca-certificates \
  && wget -O ghost.zip "https://ghost.org/archives/ghost-${GHOST_VERSION}.zip" \
  && unzip ghost.zip \
  && npm install --production \
  && rm ghost.zip \
  && apk del dev \
  && npm cache clean \
  && rm -rf /tmp/npm*

COPY ./config.js $GHOST_SOURCE/config.example.js
ADD ./themes $GHOST_SOURCE/content/themes
COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

EXPOSE 2368
ENTRYPOINT ["/sbin/tini"]
CMD ["/entrypoint.sh"]
