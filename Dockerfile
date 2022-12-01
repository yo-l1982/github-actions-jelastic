FROM openjdk:19-jdk-alpine3.15
# Labels
LABEL maintainer="dovnar.alexander@gmail.com"
# Install Bash, cURL and clean up APK
RUN apk add --no-cache curl bash jq && \
    rm -vrf /var/cache/apk/*
# Create User and Group

RUN mkdir /cli
# Changing workdir
WORKDIR /cli
# Changing user

# Enable Pipefail
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Install Jelastic CLI
RUN curl -s ftp://ftp.jelastic.com/pub/cli/jelastic-cli-installer.sh | bash
# Copy entrypoint
COPY entrypoint.sh /cli/entrypoint.sh
COPY entrypoint-github.sh /cli/entrypoint-github.sh
ENTRYPOINT ["/cli/entrypoint.sh"]
