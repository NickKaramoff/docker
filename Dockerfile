FROM alpine:latest

RUN apk update \
    && apk add --no-cache \
    docker gcc git libffi-dev make musl-dev openrc openssh openssl-dev \
    python2-dev py-pip 
COPY docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh

RUN rc-update add docker boot

RUN pip install docker-compose

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "sh" ]
