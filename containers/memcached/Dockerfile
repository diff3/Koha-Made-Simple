FROM alpine:latest

RUN apk update && apk --no-cache add memcached
COPY --chmod=755 entry.sh /

USER memcached
ENTRYPOINT ["/entry.sh"]
