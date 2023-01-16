#!/bin/bash
set -o pipefail
set -x

# install python3 and jinja
apk add --no-cache --upgrade \
    "py3-jinja2<3.1.0-r0"\
    && rm -rf -- /tmp/*
