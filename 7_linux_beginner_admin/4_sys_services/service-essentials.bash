#!/bin/bash
# Date: 10/09/2020
# Author: Artsiom
# Description: Show basic cmds to work with services
# Modified: 10/09/2020

# places where to search systemd servcie units
# /usr/lib/systemd/system
# /lib/systemd/system
# /run/systemd/system (transient services)
# /etc/systemd/system

# priority of service definitions
# /etc/systemd/system                 > /run/systemd/system  > /lib/systemd/system
# (most important)                      (less important)       (least important)
# (usually overrides files in "/lib")   (transient services)   (primary locatication for services)

# print types of servcies available
ls -l /lib/systemd/system | awk -F" " '{print $9}' | awk -F"." '{print $NF}' | sort | uniq

# list units
systemctl list-units --type=socket


# xinetd - network abstraction service for low-volume services (FTP etc.)
