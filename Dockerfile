FROM alpine:3.16.1

RUN apk add --no-cache \
      curl \
      postgresql-client \
      restic

COPY backup.sh /opt/backup.sh

CMD ["/opt/backup.sh"]
