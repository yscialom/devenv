#!/bin/bash
set -o pipefail

if [[ ${EUID} == 0 ]] ; then
    echo "$0: should not be run as root." >&2
    exit 0
fi

cd

set -x
# install dependencies
apt install -y stow duf

# install yscialom/dotfiles
dotfiles=~/workspace/dotfiles
if [ -d $dotfiles ] ; then
    cd $dotfiles && git reset --hard && git checkout develop
else
    git clone --depth=1 https://github.com/yscialom/dotfiles.git $dotfiles
    cd $dotfiles
fi
rm -f -- ~/.zshrc && ./apply.sh
