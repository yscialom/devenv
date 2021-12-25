#!/bin/bash
set -x
set -o pipefail

if [[ ${EUID} == 0 ]] ; then
    echo "$0: should not be run as root." >&2
    exit 0
fi

cd

set -x

# add host
while ! ssh-keyscan -p2222 -H shell 2>/dev/null >> ~/.ssh/known_hosts ; do
    sleep 5
done

# automatically connect
cat >> ~/.bashrc <<EOF
ssh -p2222 -i ~/.ssh/id_rsa ${USER_NAME}@shell
exit
EOF
