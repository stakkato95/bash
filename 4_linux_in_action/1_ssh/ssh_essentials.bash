#!/bin/bash
# Author: Artsiom
# Date: 01/09/2020
# Description: Execute basic commands to establish connection with a server
# Modified: 01/09/2020

# check if ssh is installed
dpkg -s openssh-client
dpkg -s openssh-server

# install ssh
apt install openssh-client

# start ssh on system boot
systemctl enable ssh

# manage ssh service
systemctl status ssh
systemctl start ssh
systemctl stop ssh

# ssh to a server
ssh ubuntu@10.0.3.144

# edit settings of ssh
/etc/ssh/sshd_config

# disable login by password
# PasswordAuthentication no

# generate new keypair on client machine
ssh-keygen

# create a folder for ssh keys (if it does not exist)
ssh ubuntu@10.0.3.142 mkdir -p .ssh

# copy public key from client to server
cat .ssh/id_rsa.pub | ssh ubuntu@10.0.3.142 "cat >> .ssh/authorized_keys"

# ssh to a server with a specific key (EC2 relevant)
ssh -i .ssh/mykey.pem ubuntu@10.0.3.142

# secure copy from client to server
scp .ssh/id_rsa.pub ubuntu@10.0.3.142:/home/ubuntu/.ssh/authorized_keys
