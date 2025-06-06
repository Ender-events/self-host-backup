FROM alpine:3.22.0

RUN apk add --no-cache \
      curl \
      postgresql-client \
      restic

COPY backup.sh /opt/backup.sh

CMD ["/opt/backup.sh"]
