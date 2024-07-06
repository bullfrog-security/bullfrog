#!/bin/bash

# prevent timezone prompts
export DEBIAN_FRONTEND=noninteractive

# update package list
apt-get update

apt-get install --yes jq make gcc net-tools libnetfilter-queue-dev

# https://askubuntu.com/questions/1367139/apt-get-upgrade-auto-restart-services
apt-get remove --yes needrestart

# install golang 1.22.4
curl -OL https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/vagrant/.bashrc

# install Node.js 20.x
curl -sL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

# install docker

# Add Docker's official GPG key:
apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

usermod -aG docker vagrant
