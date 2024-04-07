#!/bin/bash
set -o pipefail
set -x

# install ansible
apk add --no-cache --upgrade \
    'ansible<5.9.0' \
    && rm -rf -- /tmp/*
