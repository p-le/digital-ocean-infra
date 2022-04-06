FROM hashicorp/terraform AS terraform-bin

FROM ubuntu:focal

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG TERRAGRUNT_VERSION=v0.36.6

RUN apt-get update \
  && apt-get install -y \
    wget \
    zip \
    ca-certificates \
    openssh-client \
    less \
    jq \
  && rm -rf /var/lib/apt/lists/*

# Create the user, update folder permissions
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s /bin/bash

COPY --from=terraform-bin /bin/terraform /usr/local/bin/terraform

RUN wget -O /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
  && wget -O /tmp/doctl.tar.gz https://github.com/digitalocean/doctl/releases/download/v1.72.0/doctl-1.72.0-linux-amd64.tar.gz \
  && tar -xf /tmp/doctl.tar.gz -C /usr/local/bin

RUN chmod a+x /usr/local/bin/terraform \
    && chmod a+x /usr/local/bin/terragrunt \
    && chmod a+x /usr/local/bin/doctl

USER $USERNAME
