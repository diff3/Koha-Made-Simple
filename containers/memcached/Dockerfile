FROM alpine:latest

# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk update && apk --no-cache add memcached
COPY entry.sh /
RUN chmod 755 /entry.sh

USER memcached
ENTRYPOINT ["/entry.sh"]
