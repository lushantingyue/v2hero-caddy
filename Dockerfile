FROM alpine:latest

ENV CONFIG_JSON=none CERT_PEM=none KEY_PEM=none VER=3.20

# RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
RUN mkdir -m 777 /usr/bin/v2ray 
 
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 

CMD  /entrypoint.sh 

EXPOSE 8081
