#!/bin/bash
set -o pipefail
set -x

# install base tools
apk add --no-cache --upgrade \
    nano vim emacs \
    xxd dos2unix \
    wget curl netcat-openbsd net-tools \
    && rm -rf -- /tmp/*
