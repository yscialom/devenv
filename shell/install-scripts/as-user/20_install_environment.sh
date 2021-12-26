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
ln -s /ysc/oh-my-zsh-config/agnostic-shell-rc      ${CUSTOM}/.agnostic-shell-rc
ln -s /ysc/oh-my-zsh-config/agnostic-shell-aliases ${CUSTOM}/.agnostic-shell-aliases
ln -s /ysc/oh-my-zsh-config/custom.zsh             ${CUSTOM}/.

