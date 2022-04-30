#!/bin/bash

apt-get -y update

apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

apt-get -y update
apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    python3-pip \
    git

pip3 install docker-compose

useradd -m cvat -s /bin/bash
sudo usermod -aG docker cvat

cat <<EOF > /etc/sudoers.d/cvat
cvat ALL=(ALL) NOPASSWD:ALL
EOF

git clone https://github.com/opencv/cvat /home/cvat/cvat
chown -R cvat:cvat /home/cvat/cvat