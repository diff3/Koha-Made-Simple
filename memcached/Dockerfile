FROM debian:bullseye

FROM alpine:latest

RUN apk update && apk --no-cache add memcached

CMD /etc/inid.d/memcached start
