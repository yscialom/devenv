#!/bin/bash
set -o pipefail

cat >> ~/.agnostic-shell-aliases <<EOF
alias arduino-cli="docker run --rm --mount type=bind,source=/home/yscialom/work/.devenv/shell.codedata/arduino,destination=/arduino yankelscialom/arduino-cli-esp8266:0.20.2_0.1.1"
EOF
