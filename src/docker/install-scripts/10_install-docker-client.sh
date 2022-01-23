#!/bin/bash
set -o pipefail
set -x

# install ansible
apk add --no-cache --upgrade \
    docker-cli=20.10.11-r0 \
    docker-compose=1.28.0-r1 \
    && rm -rf -- /tmp/*

docker_guid=$(stat --format=%g /var/run/docker.sock)
groupadd --gid ${docker_guid} --system docker
usermod -aG docker ${USER_NAME}
