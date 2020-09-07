#!/bin/bash
# Author: Artsiom
# Date: 07/09/2020
# Description: SHow basic cmds for firewalld
# Modified: 07/09/2020

# get default zone
firewall-cmd --get-default-zone

# get zones infos
firewall-cmd --get-zones
firewall-cmd --get-active-zones

# get info about a zone
firewall-cmd --zone=trusted --list-all

# get total number of available services
firewall-cmd --get-services | tr ' ' '\n' | wc -l

# check if some service is available
firewall-cmd --get-services | tr ' ' '\n' | grep xmpp

# add http service to public zone
sudo firewall-cmd --zone=public --add-service=https

# check what ICMP messages are allowed
firewall-cmd --get-icmptypes

# prevent ping-DOS attack
firewall-cmd --zone=public --permanent --add-icmp-block=echo-reply
