FROM debian:bullseye-slim@sha256:cdf2e66fbf065b0baad9798499c43ea91e01e11e5c970e8d0a60caf443d28727

# github metadata
LABEL org.opencontainers.image.source=https://github.com/uwcip/infrastructure-keepalived

# install updates and dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -q update && apt-get -y upgrade && \
    apt-get install -y --no-install-recommends tini keepalived curl socat && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["tini", "--", "/usr/sbin/keepalived", "--no-syslog", "--dont-fork", "--log-console"]
