#!/bin/bash
# Author: Artsiom
# Date: 19/09/2020
# Description: Deploy a mediawiki service with nginx, php-fpm and mariadb
# Modified: 19/09/2020

# add nginx repository
# https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/
#
#[nginx]
#name=nginx repo
#baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
#enabled=1
#gpgcheck=0
#
# $basearch - architecture of host machine (amd64, arm, etc.)
# gpgcheck=0 - ignore checking repo keys

# reset iptables
iptables -F
setenforce 0 # disble SELinux in current session
sudo vi /etc/selinux/config # set SELINUX=permissive, to disable SELinux after reboot

# configure nginx to destribute static data
