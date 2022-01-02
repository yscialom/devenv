#!/bin/bash
set -o pipefail
set -x

# install ansible
apk add --no-cache --upgrade \
    ansible=2.10.7-r0 \
    && rm -rf -- /tmp/*
