#!/bin/bash
set -o pipefail

if [[ ${EUID} == 0 ]] ; then
    echo "$0: should not be run as root." >&2
    exit 0
fi

cd

set -x
# install yscialom/dotfiles
git clone --depth=1 https://github.com/yscialom/dotfiles.git ??? \
    && cd ??? \
    && rm -f -- ~/.zshrc \
    && ./apply.sh
