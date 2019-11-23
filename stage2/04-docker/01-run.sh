#!/bin/bash -e

on_chroot << \EOF
curl -fsSL https://download.docker.com/linux/raspbian/gpg | apt-key add -qq - >/dev/null
echo "deb [arch=armhf] https://download.docker.com/linux/raspbian stretch edge" > /etc/apt/sources.list.d/docker.list
apt-get update
# Pin version because of https://github.com/moby/moby/issues/38175
apt-get install -y docker-ce=18.06.3~ce~3-0~raspbian
adduser $FIRST_USER_NAME docker
pip install docker-compose
EOF
