FROM alpine:latest

ENV CONFIG_JSON=none CERT_PEM=none KEY_PEM=none VER=3.20

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /usr/bin/v2ray \ 
 && cd /usr/bin/v2ray \
 && wget -O v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
 && unzip v2ray.zip \
 && mv /usr/bin/v2ray/v2ray-v$VER-linux-64/v2ray /usr/bin/v2ray/ \
 && mv /usr/bin/v2ray/v2ray-v$VER-linux-64/v2ctl /usr/bin/v2ray/ \
 && mv /usr/bin/v2ray/v2ray-v$VER-linux-64/geoip.dat  /usr/bin/v2ray/ \
 && mv /usr/bin/v2ray/v2ray-v$VER-linux-64/geosite.dat /usr/bin/v2ray/ \
 && chmod +x /usr/bin/v2ray/v2ray \
 && rm -rf v2ray.zip \
 && rm -rf v2ray-v$VER-linux-64 \
 && chgrp -R 0 /usr/bin/v2ray/ \
 && chmod -R g+rwX /usr/bin/v2ray/ 
 
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

CMD  /entrypoint.sh 

EXPOSE 8081
