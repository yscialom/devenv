#!/bin/bash
set -o pipefail

cat >> ~/.agnostic-shell-aliases <<EOF
alias arduino-cli="docker run --rm \
    --mount type=bind,source=/home/yscialom/work/.devenv/shell.codedata/arduino,destination=/arduino \
    --device /dev/ttyUSB0 \
    yankelscialom/arduino-cli-esp8266"
function arduino-compile () {
    local sketch="${1:-$(basename $(readlink -f .))}"
    arduino-cli compile --fqbn esp8266:esp8266:d1 "${sketch}"
}
function arduino-upload () {
    local sketch="${1:-$(basename $(readlink -f .))}"
    arduino-cli upload --fqbn esp8266:esp8266:d1 --input-dir "/arduino/${sketch}/build/esp8266.esp8266.d1" --port /dev/ttyUSB0
}
EOF
