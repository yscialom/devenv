#!/bin/bash
set -o pipefail

if [[ ${EUID} == 0 ]] ; then
    echo "$0: should not be run as root." >&2
    exit 0
fi

cd

set -x

CUSTOM=~/.oh-my-zsh/custom

rm -f -- ${CUSTOM}/*.zsh
cp /ysc/oh-my-zsh-config/agnostic-shell-rc      ~/.agnostic-shell-rc
cp /ysc/oh-my-zsh-config/agnostic-shell-aliases ~/.agnostic-shell-aliases
ln -s /ysc/oh-my-zsh-config/custom.zsh          ${CUSTOM}/.
