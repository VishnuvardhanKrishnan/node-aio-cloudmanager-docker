FROM node:14-alpine

# Installing Adobe I/O CLI
RUN npm install -g @adobe/aio-cli

# Installating Cloud Manager Plugin for the Adobe I/O CLI
RUN aio plugins:install @adobe/aio-cli-plugin-cloudmanager

# Updating the plugins
RUN aio plugins:update

RUN set -x \
    && . /etc/os-release \
    && case "$ID" in \
        alpine) \
            apk add --no-cache bash git openssh \
            ;; \
        debian) \
            apt-get update \
            && apt-get -yq install bash git openssh-server \
            && apt-get -yq clean \
            && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            ;; \
    esac \
    # show installed application versions
    && git --version && bash --version && ssh -V && npm -v && node -v && yarn -v && aio --version
