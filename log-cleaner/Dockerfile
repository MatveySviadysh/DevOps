FROM alpine:latest

RUN apk add --no-cache bash coreutils

COPY entrypoint.sh /entrypoint.sh
COPY generate_logs.sh /generate_logs.sh
COPY cleanup.sh /cleanup.sh

RUN chmod +x /entrypoint.sh /generate_logs.sh /cleanup.sh

ENTRYPOINT ["/entrypoint.sh"]
