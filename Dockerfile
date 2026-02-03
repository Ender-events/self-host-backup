FROM alpine:3.23.3

RUN apk add --no-cache \
      curl \
      postgresql-client \
      restic

COPY backup.sh /opt/backup.sh

CMD ["/opt/backup.sh"]
