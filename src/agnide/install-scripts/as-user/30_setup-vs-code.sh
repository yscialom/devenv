#!/bin/bash
set -x
set -o pipefail

if [[ ${EUID} == 0 ]] ; then
    echo "$0: should not be run as root." >&2
    exit 0
fi

cd

set -x
mkdir -p /config/data/User
cp -f /ysc/vs-code/User/settings.json /config/data/User/settings.json
