#!/bin/bash
set -o pipefail
set -x

for script in $(dirname $0)/as-user/* ; do
    [[ -x "${script}" ]] && su -c "${script}" ${USER_NAME}
done
