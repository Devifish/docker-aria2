FROM alpine:latest
LABEL MAINTAINER Devifish <devifish@outlook.com>

WORKDIR /aria2
COPY src/ ./

RUN set -xe \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache aria2 \
    && chmod +x init.sh

VOLUME /data /downloads
EXPOSE 6800
ENTRYPOINT ["./init.sh"]