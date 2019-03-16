FROM alpine:latest

RUN apk update && apk add --no-cache docker openrc git openssh
COPY docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh

RUN rc-update add docker boot

RUN apk add py-pip
RUN pip install docker-compose

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "sh" ]
