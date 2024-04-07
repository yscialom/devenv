#!/bin/bash
set -o pipefail

if [[ ${EUID} == 0 ]] ; then
    echo "$0: should not be run as root." >&2
    exit 0
fi

cd

set -x
# setup git-ssh
eval "$(ssh-agent -s)"
ssh-add /config/.ssh/id_rsa
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
