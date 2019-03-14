FROM alpine:latest

RUN apk update && apk add docker
COPY docker-entrypoint.sh /usr/local/bin/

RUN apk add py-pip
RUN pip install docker-compose

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "sh" ]
