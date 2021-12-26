#!/bin/bash
set -o pipefail
set -x

# install base tools
apk add --no-cache \
    wget=1.21.1-r1 \
    git=2.32.0-r0 git-perl=2.32.0-r0 \
    zsh=5.8-r2 \
    dpkg \
    && rm -rf -- /tmp/*

# install Fira Code from Nerd fonts
NERDS_FONT_VERSION="2.1.0" \
    && FONT_DIR=/usr/local/share/fonts \
    && FIRA_CODE_URL=https://github.com/ryanoasis/nerd-fonts/raw/${NERDS_FONT_VERSION}/patched-fonts/FiraCode \
    && FIRA_CODE_LIGHT_DOWNLOAD_SHA256="5e0e3b18b99fc50361a93d7eb1bfe7ed7618769f4db279be0ef1f00c5b9607d6" \
    && FIRA_CODE_REGULAR_DOWNLOAD_SHA256="3771e47c48eb273c60337955f9b33d95bd874d60d52a1ba3dbed924f692403b3" \
    && FIRA_CODE_MEDIUM_DOWNLOAD_SHA256="42dc83c9173550804a8ba2346b13ee1baa72ab09a14826d1418d519d58cd6768" \
    && FIRA_CODE_BOLD_DOWNLOAD_SHA256="060d4572525972b6959899931b8685b89984f3b94f74c2c8c6c18dba5c98c2fe" \
    && FIRA_CODE_RETINA_DOWNLOAD_SHA256="e254b08798d59ac7d02000a3fda0eac1facad093685e705ac8dd4bd0f4961b0b" \
    && mkdir -p $FONT_DIR \
    && wget -nv -P $FONT_DIR $FIRA_CODE_URL/Light/complete/Fura%20Code%20Light%20Nerd%20Font%20Complete.ttf \
    && wget -nv -P $FONT_DIR $FIRA_CODE_URL/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete.ttf \
    && wget -nv -P $FONT_DIR $FIRA_CODE_URL/Medium/complete/Fura%20Code%20Medium%20Nerd%20Font%20Complete.ttf \
    && wget -nv -P $FONT_DIR $FIRA_CODE_URL/Bold/complete/Fura%20Code%20Bold%20Nerd%20Font%20Complete.ttf \
    && wget -nv -P $FONT_DIR $FIRA_CODE_URL/Retina/complete/Fura%20Code%20Retina%20Nerd%20Font%20Complete.ttf \
    && echo "$FIRA_CODE_LIGHT_DOWNLOAD_SHA256 $FONT_DIR/Fura Code Light Nerd Font Complete.ttf" | sha256sum -c - \
    && echo "$FIRA_CODE_REGULAR_DOWNLOAD_SHA256 $FONT_DIR/Fura Code Regular Nerd Font Complete.ttf" | sha256sum -c - \
    && echo "$FIRA_CODE_MEDIUM_DOWNLOAD_SHA256 $FONT_DIR/Fura Code Medium Nerd Font Complete.ttf" | sha256sum -c - \
    && echo "$FIRA_CODE_BOLD_DOWNLOAD_SHA256 $FONT_DIR/Fura Code Bold Nerd Font Complete.ttf" | sha256sum -c - \
    && echo "$FIRA_CODE_RETINA_DOWNLOAD_SHA256 $FONT_DIR/Fura Code Retina Nerd Font Complete.ttf" | sha256sum -c -

# Set zsh as default shell
sed -i "/^${USER_NAME}/s/bash\$/zsh/" /etc/passwd
