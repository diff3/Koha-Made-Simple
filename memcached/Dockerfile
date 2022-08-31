FROM alpine:latest

COPY entry.sh /
RUN apk update && apk --no-cache add memcached && chmod +x /entry.sh

USER memcached
CMD ["/entry.sh"]
