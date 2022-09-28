FROM node:14-alpine

# Installing Adobe I/O CLI
RUN echo n | npm install -g @adobe/aio-cli@8.3.0

# Installating Cloud Manager Plugin for the Adobe I/O CLI
RUN aio plugins:install @adobe/aio-cli-plugin-cloudmanager

# Updating the plugins
RUN aio plugins:update

RUN set -x \
    && . /etc/os-release \
    # installing bash, git and openssh
    && apk add --no-cache bash git openssh

# show installed application versions
RUN git --version && bash --version && ssh -V && npm -v && node -v && yarn -v && aio --version
