FROM debian:bullseye-slim@sha256:5cf1d98cd0805951484f33b34c1ab25aac7007bb41c8b9901d97e4be3cf3ab04 AS base

# github metadata
LABEL org.opencontainers.image.source=https://github.com/uwcip/infrastructure-keepalived

# install updates and dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -q update && apt-get -y upgrade && \
    apt-get install -y --no-install-recommends tini keepalived netcat-openbsd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tini", "--", "/usr/sbin/keepalived", "--no-syslog", "--dont-fork", "--log-console"]
