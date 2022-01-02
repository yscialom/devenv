#!/bin/bash
set -o pipefail
set -x

# install python3 and jinja
apk add --no-cache --upgrade \
    python3=3.9.5-r2 \
    py3-jinja2=3.0.1-r0\
    && rm -rf -- /tmp/*
