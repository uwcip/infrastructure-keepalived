FROM debian:bullseye-slim@sha256:10b622c6cf6daa0a295be74c0e412ed20e10f91ae4c6f3ce6ff0c9c04f77cbf6 AS base

# github metadata
LABEL org.opencontainers.image.source=https://github.com/uwcip/infrastructure-keepalived

# install updates and dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -q update && apt-get -y upgrade && \
    apt-get install -y --no-install-recommends tini keepalived netcat-openbsd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tini", "--", "/usr/sbin/keepalived", "--no-syslog", "--dont-fork", "--log-console"]
