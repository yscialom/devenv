#!/bin/bash
set -o pipefail

if [[ ${EUID} == 0 ]] ; then
    echo "$0: should not be run as root." >&2
    exit 0
fi

cd

set -x

# install oh-my-zsh
wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh || true

# install oh-my-zsh plugins and theme
ZSH_CUSTOM=~/.oh-my-zsh/custom

ZSH_PLUGINS=${ZSH_CUSTOM}/plugins \
    && ZSH_THEMES=${ZSH_CUSTOM}/themes \
    && git clone --single-branch --branch '0.7.1'  --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_PLUGINS}/zsh-syntax-highlighting \
    && git clone --single-branch --branch 'v0.6.4' --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git     ${ZSH_PLUGINS}/zsh-autosuggestions \
    && git clone --single-branch                   --depth 1 https://github.com/romkatv/powerlevel10k.git             ${ZSH_THEMES}/powerlevel10k

# install gitstatus
GITSTATUS_VERSION="1.0.0" \
    && GITSTATUS_SHA256="e33867063f091d3c31ede9916fef079ff8cd6fdcc70d051914f962ab3b8f36fd" \
    && wget -nv -O gitstatus.tgz https://github.com/romkatv/gitstatus/releases/download/v${GITSTATUS_VERSION}/gitstatusd-linux-x86_64.tar.gz \
    && echo "$GITSTATUS_SHA256 gitstatus.tgz" | sha256sum -c - \
    && mkdir -p ./.cache/gitstatus \
    && tar zxvf gitstatus.tgz --directory ./.cache/gitstatus \
    && rm gitstatus.tgz

# override files
cp -f -- /oh-my-zsh-config/zshrc ~/.zshrc
cp -f -- /oh-my-zsh-config/p10k.zsh ~/.p10k.zsh
