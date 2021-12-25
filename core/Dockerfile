FROM aifrak/oh-my-zsh

USER root

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        nano vim emacs \
        xxd dos2unix \
        wget curl netcat net-tools \
        ca-certificates=* \
    && apt-get clean \
    && rm -rf -- /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER $APP_USER

WORKDIR /home/${APP_USER}

RUN rm -rf -- .oh-my-zsh/custom/*.zsh \
    && sed -i '/^ *\(z\|globalias\|zsh-navigation-tools\) *$/d' .zshrc

COPY rcfiles/* .oh-my-zsh/custom/
