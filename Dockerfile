FROM alpine:3.18.3

LABEL maintainer="Olumayowa Taiwo <olumayor99@gmail.com>"

ENV DOCKER_COMPOSE_VERSION=2.20.2-r1

# Install Docker and Docker Compose
RUN apk --no-cache add --update \
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
    docker-compose=${DOCKER_COMPOSE_VERSION}



# Include functions to start/stop docker daemon
COPY docker-lib.sh /docker-lib.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
