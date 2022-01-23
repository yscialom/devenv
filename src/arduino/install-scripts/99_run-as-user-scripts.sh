#!/bin/bash
set -o pipefail
set -x

for script in $(ls $(dirname $0)/as-user/* | sort | xargs) ; do
    [[ -x "${script}" ]] && su -c "${script}" -s /bin/bash $(id -un ${PUID})
done
