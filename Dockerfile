FROM alpine:3.18.3

LABEL maintainer="Olumayowa Taiwo <olumayor99@gmail.com>"

ENV DOCKER_VERSION=23.0.6-r4 \
    DOCKER_COMPOSE_VERSION=2.17.3-r5

# Install Dependencies
RUN apk --no-cache add \
    bash \
    curl \
    util-linux \
    device-mapper \
    libffi-dev \
    openssl-dev \
    py3-pip \
    python3-dev \
    gcc \
    libc-dev \
    make \
    iptables \
    docker=${DOCKER_VERSION} \
    docker-compose=${DOCKER_COMPOSE_VERSION}

RUN docker --version

# Include functions to start/stop docker daemon
COPY docker-lib.sh /docker-lib.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
