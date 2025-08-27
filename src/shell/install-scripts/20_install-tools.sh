#!/bin/bash
set -o pipefail
set -x

# install base tools
apt install -y \
    nano vim emacs \
    xxd dos2unix \
    wget curl netcat-openbsd net-tools \
    eza bat stow zoxide
