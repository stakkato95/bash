#!/bin/bash
# Author: Artsiom
# Date: 02/09/2020
# Description: Basic sequrity for a web server
# Modified: 02/09/2020

# enable ubuntu firewall
ufw enable
# allow ssh
ufw allow ssh
# allow http and https
ufw allow 80
ufw allow 443
# check status of firewall
ufw status
# allow ssh from a specific client
ufw allow from 10.0.3.1 to any port 22

# setting for /etc/ssh/sshd_conf
# PermitRootLogin no
# PasswordAuthentication no

# noone should have root permissions. check whether there is a regular user with root ID or root group ID
awk -F: '($3 == "0") {print}' /etc/passwd
awk -F: '($4 == "0") {print}' /etc/passwd

# show processes listening on ports
netstat -npl

# disable unnecessary services
systemctl list-unit-files --type=service --state=enabled
systemctl stop mongodb
systemctl disable mongodb

# remove unnecessary packages
dpkg --list
