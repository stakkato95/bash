#!/bin/bash
# Author: Artsiom
# Date: 07/09/2020
# Description: List cmds for systemd
# Modified: 07/09/2020

# list reached targets
journalctl | grep Reached | tail -20

# list default target
systemctl get-default

# set default target
sudo systemctl set-default graphical.target

# list deamons of default.target and NetworkManager
systemctl list-dependencies default.target
systemctl list-dependencies NetworkManager

# show mappings from runlevel to targets
ls -l /lib/systemd/system | grep "runlevel*"

# systemd settings
ls -l /etc/systemd

# is deamon enabled / active
systemctl is-enabled NetworkManager
systemctl is-active NetworkManager

# show unit definition
systemctl cat NetworkManager

# reload systemd
sudo systemctl daemon-reload

# folder with targets and services (definitions) 
/lib/systemd/system

# folder with symbolik links and configs (wants)
/etc/systemd/sustem
