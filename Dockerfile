FROM alpine:3.13.2

RUN apk add --no-cache restic postgresql-client

COPY backup.sh /opt/backup.sh

CMD ["/opt/backup.sh"]
