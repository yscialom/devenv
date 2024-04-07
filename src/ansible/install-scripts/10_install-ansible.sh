#!/bin/bash
set -o pipefail
set -x

# install ansible
apk add --no-cache --upgrade \
    'ansible<5.8.0-r0' \
    && rm -rf -- /tmp/*
