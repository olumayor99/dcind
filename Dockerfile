# Inspired by https://github.com/mumoshu/dcind
FROM alpine:3.18.3
LABEL maintainer="Dmitry Matrosov <amidos@amidos.me>"

ENV DOCKER_VERSION=24.0.5 \
    DOCKER_COMPOSE_VERSION=1.29.2

# Install Docker and Docker Compose
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
    iptables

RUN curl https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar zx && \
    mv /docker/* /bin/ && \
    chmod +x /bin/docker*

RUN pip install pyyaml~=6.0

RUN pip install docker-compose==${DOCKER_COMPOSE_VERSION}

RUN rm -rf /root/.cache

# Include functions to start/stop docker daemon
COPY docker-lib.sh /docker-lib.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
