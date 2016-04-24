FROM gabrielrezzonico/docker-debian:0.0.1

MAINTAINER Gabriel Rezzonico <gabrielrezzonico@gmail.com>

ENV NODE_VERSION=5.6.0 \
    NVM_VERSION=0.31.0

# Dependencies
# https://github.com/creationix/nvm#installation
# http://stackoverflow.com/questions/27144426/error-the-certificate-of-raw-githubusercontent-com-is-not-trusted

USER root
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    libssl-dev 

USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}/

# Nvm install using the nvm script
# https://github.com/creationix/nvm#install-script

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash \
    && export NVM_DIR="/home/${DOCKER_USER}/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
    && nvm install ${NODE_VERSION}

ENTRYPOINT ["/bin/bash","-l","@$"]
