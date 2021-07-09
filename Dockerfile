FROM debian:bullseye-slim@sha256:94133c8fb81e4a310610bc83be987bda4028f93ebdbbca56f25e9d649f5d9b83

# github metadata
LABEL org.opencontainers.image.source=https://github.com/uwcip/infrastructure-keepalived

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -q update && \
    apt-get install -y --no-install-recommends tini keepalived curl socat && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tini", "--", "/usr/sbin/keepalived", "--no-syslog", "--dont-fork", "--log-console"]
