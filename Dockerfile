FROM alpine:3.18.4

RUN apk add --no-cache \
      curl \
      postgresql-client \
      restic

COPY backup.sh /opt/backup.sh

CMD ["/opt/backup.sh"]
